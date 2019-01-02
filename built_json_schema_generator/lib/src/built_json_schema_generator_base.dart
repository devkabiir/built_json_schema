/// Generate `BuiltValue` models from json schema
part of built_json_schema_generator;

// ignore_for_file: always_specify_types, unnecessary_null_in_if_null_operators
// ignore_for_file: avoid_as, comment_references

const List<String> _defaultIgnoredRules = [
  'avoid_as',
  'sort_constructors_first',
  'sort_unnamed_constructors_first',
  'lines_longer_than_80_chars',
];

final _dartEmitter = DartEmitter();

/// Returns true if [obj] is not null and not empty Works for string, list, map
bool _truthy(obj) {
  if (obj == null) {
    return false;
  }

  if (obj is String && obj.isEmpty) {
    return false;
  }

  if (obj is List && obj.isEmpty) {
    return false;
  }

  if (obj is Map && obj.keys.isEmpty) {
    return false;
  }

  return true;
}

/// Generator that runs for each annotation
class BuilJsonSchemaAnnotationGenerator {
  BuiltJsonSchema _annotation;

  /// Options passed to this builder via `build.yaml`
  final BuiltJsonSchemaGeneratorOptions options;

  ///
  BuilJsonSchemaAnnotationGenerator(this.options);

  ///
  // ignore: mismatched_getter_and_setter_types
  BuiltJsonSchema get annotation => _annotation;

  ///
  set annotation(ConstantReader c) => _annotation = BuiltJsonSchema(
        docs: c
                ?.peek('docs')
                ?.listValue
                ?.map<String>((d) => d.toStringValue())
                ?.toList() ??
            options.docs,
        libraryDocs: c
                ?.peek('docs')
                ?.listValue
                ?.map<String>((d) => d.toStringValue())
                ?.toList() ??
            options.libraryDocs,
        path: c?.peek('path')?.stringValue ?? options.path,
        json: c?.peek('json')?.stringValue ?? options.json,
        key: c?.peek('key')?.stringValue ?? options.key,
        typeName: c?.peek('typeName')?.stringValue ?? options.typeName,
        version: c?.peek('version')?.stringValue ?? options.version,
        definitionModels:
            c?.peek('definitionModels')?.boolValue ?? options.definitionModels,
        nestedModels:
            c?.peek('nestedModels')?.boolValue ?? options.nestedModels,
        generateValidators: c?.peek('generateValidators')?.boolValue ??
            options.generateValidators,
      );

  /// Generates model with its dependencies
  Future<List<Class>> generate(ConstantReader c, BuildStep buildStep) async {
    annotation = c;
    c.revive();
    if (_truthy(annotation.file) && p.isAbsolute(annotation.file)) {
      throw InvalidGenerationSourceError(
        '`BuiltJsonSchema.path` must be relative path to the source file.'
            ' Given file path : ${annotation.file}',
      );
    }

    final sourcePathDir = p.dirname(buildStep.inputId.path);

    final fileId = _truthy(annotation.file)
        ? AssetId(
            buildStep.inputId.package, p.join(sourcePathDir, annotation.file))
        : null;

    Map<String, dynamic> schemaMap = json.decode(annotation.json ??
        (fileId != null
            ? (await buildStep.readAsString(fileId))
            : (await http.get(annotation.url)).body));

    final key = annotation.key;

    if (_truthy(key)) {
      final paths = key.split('#');

      for (var k in paths) {
        final Map<String, dynamic> schema = schemaMap[k];
        schemaMap = schema;
      }
    }

    final schema = await j.JsonSchema.createSchemaAsync(schemaMap);

    final allModels = <String, Class>{};

    if (annotation.definitionModels) {
      logger.warning('definitions are not fully suported at this time');
      schema.definitions.forEach((defName, defSchema) {
        final models = _generateBuiltClass(
          ReCase(defName),
          defSchema,
        );

        for (var model in models) {
          allModels[model.name] = model;
        }
      });
    }

    /// Generate a model for top-level object in json schema
    final models = _generateBuiltClass(
        ReCase('${annotation.typeName ?? schema.title}'), schema);

    for (var model in models) {
      allModels[model.name] = model;
    }

    return allModels.values.toList();
  }

  /// Returns `BuiltValue` class of name `BuiltJsonSchema.typeName`
  List<Class> _generateBuiltClass(
    ReCase typeName,
    j.JsonSchema schema, {
    String parent = '',
  }) {
    if (!_truthy(schema.properties) && !_truthy(schema.enumValues)) {
      throw Exception('Expected to be at least one property for schema:\n'
          '${typeName.camelCase}: $schema');
    }

    final allModels = <Class>[];
    final nestedModels = <Class>[];

    final docs = _truthy(schema.description)
        ? [schema.description]
        : (_truthy(parent) ? ['$typeName model class'] : annotation.docs);

    var model = Class(
      (b) => b
        ..name = '${typeName.pascalCase}'
        ..docs = ListBuilder(
          docs.map((s) => '/// $s')?.toList(),
        )
        ..abstract = true
        ..implements = ListBuilder(
          <Reference>[
            refer(
              'Built<${typeName.pascalCase}, ${typeName.pascalCase}Builder>',
            ),
          ],
        ),
    );

    final propertyGetters = ListBuilder<Method>();
    final propertyDefaults = <Map<String, String>>[];

    for (var propertyName in schema.properties.keys) {
      final propertySchema = schema.properties[propertyName];
      // print('${schema.schemaMap['context']}'); // available for all properties

      final name = ReCase(propertyName);

      var getterType = _jsonToDartType(
        name,
        propertySchema,

        /// nestedModels will be prefixed with topLevelModel
        parent: typeName.pascalCase,
      );

      final isNewType = getterType.contains(typeName.pascalCase);
      var alreadyExists = false;

      var defaultType = getterType == 'JsonObject'
          ? _DefaultKind.jsonObject
          : (getterType.contains('BuiltList')
              ? _DefaultKind.builtList
              : _DefaultKind.literal);

      if (isNewType && annotation.definitionModels && !_truthy(parent)) {
        for (var def in schema.definitions.keys) {
          if (propertySchema.path == schema.definitions[def].path) {
            getterType = ReCase(def).pascalCase;
            defaultType = _truthy(schema.definitions[def].properties)
                ? _DefaultKind.builtValue
                : _DefaultKind.enumClass;
            alreadyExists = true;
            break;
          }
        }
      }

      /// Create the model only if it doesn't already exists
      if (!alreadyExists && isNewType && annotation.nestedModels) {
        if (propertySchema.enumValues.isNotEmpty) {
          nestedModels.add(_generateBuiltEnum(
            ReCase(getterType),
            propertyName,
            propertySchema,
            typeName.pascalCase,
          ));
          defaultType = _DefaultKind.enumClass;
        } else {
          nestedModels.addAll(_generateBuiltClass(
            ReCase(getterType),
            propertySchema,
            parent: typeName.pascalCase,
          ));
          defaultType = _DefaultKind.builtValue;
        }
      }

      _generatePropertyDefaults(
          name, propertySchema, getterType, defaultType, propertyDefaults);

      propertyGetters.add(
        Method(
          (b) {
            b
              ..returns = refer(getterType)
              ..name = name.camelCase
              ..type = MethodType.getter
              ..annotations = ListBuilder(<Expression>[
                const CodeExpression(Code('nullable')),
              ])
              ..docs = ListBuilder(<String>[
                '/// ${propertySchema.description}',
              ]);

            if (name.camelCase != propertyName) {
              /// Add wiereName when required
              b.annotations.add(CodeExpression(
                  Code("BuiltValue(wireName: '$propertyName')")));
            }
          },
        ),
      );
    }

    // final _dartEmitter = DartEmitter();

    /// Generate code block for defaults
    final fieldDefaultCode = propertyDefaults.fold<String>('',
        (acc, field) => '$acc..${field.keys.first} = ${field.values.first}\n');

    /// Add getter for `serializer`
    propertyGetters.add(
      Method(
        (b) => b
          ..docs = ListBuilder(<String>[
            '/// Used for serializing and deserializing [${typeName.pascalCase}] data',
          ])
          ..name = 'serializer'
          ..type = MethodType.getter
          ..static = true
          ..returns = refer('Serializer<${typeName.pascalCase}>')
          ..lambda = true
          ..body = Code('_\$${typeName.camelCase}Serializer'),
      ),
    );

    /// Method to validate against schema
    // TODO(devkabiir): literal methods may not be escaping strings, https://github.com/devkabiir/built_json_schema/issues/
    // final $schema = Method((b) => b
    //   ..name = r'$schema'
    //   ..static = true
    //   ..returns = refer('Map<String,dynamic>')
    //   ..body = ToCodeExpression(literalConstMap(
    //     schema.schemaMap,
    //     refer('String'),
    //     refer('dynamic'),
    //   )));

    /// Constructors
    final constructors =
        _generateBuiltValueConstructors(typeName, fieldDefaultCode);

    model = model.rebuild(
      (b) {
        b
          ..constructors = constructors
          ..methods = propertyGetters;
      },
    );

    return allModels
      ..add(model)
      ..addAll(nestedModels);
  }

  Class _generateBuiltEnum(
      ReCase typeName, String wireName, j.JsonSchema schema, String parent) {
    final enumClass = Class(
      (b) => b
        ..name = typeName.pascalCase
        ..docs = ListBuilder(<String>[
          '/// ${_truthy(schema.description) ? schema.description : 'An enum like class that holds possible values of `$wireName`'}',
        ])
        ..extend = refer('EnumClass')
        ..fields = ListBuilder(
          schema.enumValues.map<Field>(
            (v) {
              final value = ReCase(v);
              return Field(
                (b) => b
                  ..name = value.camelCase
                  ..docs = ListBuilder(<String>[
                    '/// [${typeName.pascalCase}] instance holding value `$v`'
                  ])
                  ..static = true
                  ..modifier = FieldModifier.constant
                  ..annotations = ListBuilder(
                    v == value.camelCase
                        ? []
                        : <Expression>[
                            CodeExpression(
                                Code("BuiltValueEnumConst(wireName: '$v')")),
                          ],
                  )
                  ..type = refer(typeName.pascalCase)
                  ..assignment =
                      Code('_\$${typeName.pascalCase}${value.pascalCase}'),
              );
            },
          ),
        )
        ..methods = ListBuilder(
          <Method>[
            Method(
              (b) => b
                ..docs = ListBuilder(<String>[
                  '/// Used for serializing and deserializing [${typeName.pascalCase}] data',
                ])
                ..name = 'serializer'
                ..lambda = true
                ..static = true
                ..returns = refer('Serializer<${typeName.pascalCase}>')
                ..type = MethodType.getter
                ..body = Code(' _\$${typeName.camelCase}Serializer'),
            ),
            Method(
              (b) => b
                ..name = 'values'
                ..docs = ListBuilder(<String>[
                  '/// Set of all available values for [${typeName.pascalCase}]',
                ])
                ..type = MethodType.getter
                ..static = true
                ..lambda = true
                ..returns = refer('BuiltSet<${typeName.pascalCase}>')
                ..body = Code('_\$${typeName.camelCase}Values'),
            ),
            Method(
              (b) => b
                ..name = 'valueOf'
                ..docs = ListBuilder(<String>[
                  '/// Returns an instance of [${typeName.pascalCase}] which holds [name]',
                ])
                ..static = true
                ..lambda = true
                ..returns = refer(typeName.pascalCase)
                ..requiredParameters = ListBuilder(<Parameter>[
                  Parameter(
                    (b) => b
                      ..name = 'name'
                      ..type = refer('String'),
                  ),
                ])
                ..body = Code('_\$${typeName.camelCase}ValueOf(name)'),
            ),
          ],
        )
        ..constructors = ListBuilder(<Constructor>[
          Constructor(
            (b) => b
              ..name = '_'
              ..constant = true
              ..requiredParameters = ListBuilder(<Parameter>[
                Parameter(
                  (b) => b
                    ..name = 'name'
                    ..type = refer('String'),
                ),
              ])
              ..initializers = ListBuilder(
                <Code>[
                  const Code('super(name)'),
                ],
              ),
          ),
        ]),
    );
    return enumClass;
  }

  ListBuilder<Constructor> _generateBuiltValueConstructors(
          ReCase typeName, String fieldDefaultCode) =>
      ListBuilder<Constructor>()
        ..addAll(
          [
            /// Required by BuiltValue
            Constructor((b) => b.name = '_'),
            Constructor((b) => b
              ..factory = true
              ..docs = ListBuilder(
                <String>[
                  '/// Instantiates a [${typeName.pascalCase}] object with defaults',
                  '/// set for each property, applies [updates] if specified',
                ],
              )
              ..optionalParameters = ListBuilder(
                <Parameter>[
                  Parameter((b) => b
                    ..name = 'updates(${typeName.pascalCase}Builder b)'
                    ..type = refer('void')),
                ],
              )
              ..lambda = true
              ..body = Code('''
        _\$${typeName.pascalCase}((b) =>
         b
         /// Defaults are set using the default value from the schema
         $fieldDefaultCode
         ..update(updates)
         )
         ''')),
          ],
        );

  void _generatePropertyDefaults(
    ReCase propertyName,
    j.JsonSchema propertySchema,
    propertyType,

    /// Can be literal(str,list,map,int,num,bool,null), Enum, Class(object),
    /// JsonObject, BuiltList
    _DefaultKind defaultType,
    List<Map<String, String>> propertyDefaults,
  ) {
    String literalValue;
    if (_truthy(propertySchema.defaultValue)) {
      switch (defaultType) {
        case _DefaultKind.literal:
          literalValue =
              '${literal(propertySchema.defaultValue).accept(_dartEmitter)}';
          break;
        case _DefaultKind.enumClass:
          final value = ReCase(propertySchema.defaultValue).camelCase;
          literalValue = '$propertyType.$value';

          break;
        case _DefaultKind.builtValue:
          logger.warning(
              '${propertyName.camelCase}: objects with default value are not'
              ' fully supported');

          /// This doesnt make sense, since object may have properties with
          /// default value but this only gets generated if the object itself
          /// has default value
          /// `literalValue = '$propertyType().toBuilder()';`

          /// Defaults are set automatically per class basis but setting them
          /// in the top level class is very recursive
          /// Also what would be the value of a property which is an object
          /// with default value. And it has its own properties with default
          /// value???
          // ignore: literal_only_boolean_expressions
          if (true) {
            return;
          }
          // ignore: dead_code
          if (propertySchema.defaultValue is! Map) {
            throw Exception(
                'Expected default value for ${propertyName.camelCase}'
                ' to be a map, found: ${propertySchema.defaultValue}');
          }

          final Map<String, dynamic> properties = propertySchema.defaultValue;
          literalValue = '($propertyType().toBuilder()';
          for (var property in properties.keys) {
            // ignore: use_string_buffers
            literalValue += '..${ReCase(property).camelCase} = '
                '${literal(properties[property]).accept(_dartEmitter)}';
          }
          literalValue += ')';
          break;
        case _DefaultKind.jsonObject:
          literalValue = 'JsonObject('
              '${literal(propertySchema.defaultValue).accept(_dartEmitter)}'
              ')';
          break;
        case _DefaultKind.builtList:
          literalValue = '($propertyType().toBuilder()..addAll('
              '${literal(propertySchema.defaultValue).accept(_dartEmitter)}'
              '))';
          break;
      }
      propertyDefaults.add({propertyName.camelCase: literalValue});
    }
  }

  /// Converts [type] to either
  ///  - int
  ///  - num
  ///  - String
  ///  - bool
  ///  - Null (Although it shouldn't but is a valid type in json-schema)
  ///
  /// Throws [Exception] for anything else
  String _jsonToDartPrimitive(j.SchemaType type) {
    switch (type) {
      case j.SchemaType.integer:
        return 'int';
      case j.SchemaType.number:
        return 'num';
      case j.SchemaType.string:
        return 'String';
      case j.SchemaType.boolean:
        return 'bool';
      case j.SchemaType.nullValue:
        return 'Null';
      default:
        throw Exception('Unsupported type');
    }
  }

  /// Returns dart primitive type for string, boolean, number, integer, null
  ///
  /// If [annotation.nestedModels] and given schema has `enumValues`
  /// or `properties` creates and returns a new type
  ///
  /// otherwise returns `JsonObject`
  ///
  /// throws Exception when couldn't convert type
  String _jsonToDartType(ReCase propertyName, j.JsonSchema schema,
      {String parent = ''}) {
    final type = schema.typeList.first;

    final shouldCreateType =
        (_truthy(schema.enumValues) || _truthy(schema.properties)) &&
            _truthy(parent) &&
            annotation.nestedModels;

    if (shouldCreateType) {
      return '$parent${propertyName.pascalCase}';
    }

    /// In case it's a string with format
    if (schema.format != null) {
      // TODO(devkabiir): add all supported string formats, https://github.com/devkabiir/built_json_schema/issues/

      switch (schema.format) {
        case 'date-time':
          return 'DateTime';
        default:
          logger.warning(
              '${propertyName.camelCase}: string format ${schema.format} '
              'not supported');
          return 'String';
      }
    }

    try {
      /// Try converting to dart primitive types
      return _jsonToDartPrimitive(type);
    } on Exception catch (_) {
      switch (type) {
        case j.SchemaType.object:
          return 'JsonObject';
        case j.SchemaType.array:
          final t = _jsonToDartPrimitive(schema.items.typeList.first);
          return 'BuiltList<$t>';
      }
    }

    throw Exception('Failed to convert type');
  }
}

///
class BuiltJsonSchemaGenerator extends Generator {
  /// Options passed to this builder via `build.yaml`
  final BuiltJsonSchemaGeneratorOptions options;

  ///
  BuiltJsonSchemaGenerator(this.options);

  /// Type checker for [BuiltJsonSchema]
  TypeChecker get annotationTypeChecker =>
      const TypeChecker.fromRuntime(BuiltJsonSchema);

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    // final result = StringBuffer();
    final generators = <Future<List<List<Class>>>>[];

    for (var element in library.allElements) {
      /// Generate for the element
      generators.add(_generateIfAnnoted(element, buildStep));
      if (element is ClassElement) {
        /// Generate for its children
        for (var f in element.fields) {
          generators.add(_generateIfAnnoted(f, buildStep));
        }
        for (var m in element.methods) {
          generators.add(_generateIfAnnoted(m, buildStep));
        }
      }
    }

    final models = (await Future.wait(generators)).fold<List<Class>>(
      <Class>[],
      (acc, nex) {
        nex.forEach(acc.addAll);
        return acc;
      },
    );
    final sourceFileName = p.basenameWithoutExtension(buildStep.inputId.path);
    final libraryName = library.element.name;
    final emittedLib = generateLibrary(
        _truthy(libraryName) ? libraryName : null, sourceFileName, models);

    return emittedLib.isNotEmpty ? '$emittedLib' : '';
  }

  /// Generates a dart library which may contain 1 or more `BuiltValue` classes
  ///
  // TODO(devkabiir): allow generating [definitionModels], https://github.com/devkabiir/built_json_schema_generator/issues/
  String generateLibrary(
    String parentLibraryName,
    String libraryFileName,
    List<Class> models,
  ) {
    /// When nothing was generated
    if (models.isEmpty) {
      return '';
    }

    final libraryName = ReCase('${parentLibraryName ?? libraryFileName}');
    final resultLibrary = StringBuffer();
    final directives = ListBuilder<Directive>()
      ..addAll([
        Directive.import('package:built_value/built_value.dart'),
        Directive.import('package:built_collection/built_collection.dart'),
        Directive.import('package:built_value/serializer.dart'),
      ]);

    if (_hasJsonObjectReference(models)) {
      directives.add(
        Directive.import('package:built_value/json_object.dart'),
      );
    }

    final ignoreRules = _generateIgnoreComment(
        _defaultIgnoredRules.toList()..addAll(options?.ignoreRules ?? []));

    final library = Library(
      (b) => b
        ..directives = directives
        ..body = (ListBuilder<Spec>()
          ..add(
            Code("part '$libraryFileName.model.g.dart';"),
          )
          ..addAll(models)
          ..add(ignoreRules)),
    );

    resultLibrary
      ..writeln('library ${libraryName.snakeCase}.model;\n')
      ..writeln(DartFormatter().format('${library.accept(_dartEmitter)}'));

    return '$resultLibrary';
  }

  /// Generates model(s) for [element] with `BuiltJsonSchema` annotation(s),
  /// an element here can be anything
  Future<List<List<Class>>> _generateIfAnnoted(
      Element element, BuildStep buildStep) {
    final annotations = annotationTypeChecker.annotationsOf(
      element,
      throwOnUnresolved: false,
    );

    // final generated = StringBuffer();
    final generators = <Future<List<Class>>>[];
    for (var annotation in annotations) {
      generators.add(BuilJsonSchemaAnnotationGenerator(options)
          .generate(ConstantReader(annotation), buildStep));
    }

    return Future.wait(generators);
  }

  Code _generateIgnoreComment([List<String> rules]) => Code(
        [
          '\n// ignore_for_file: ',
          (rules ?? _defaultIgnoredRules)
              .map<String>((ruleName) => '$ruleName')
              .join(', '),
          '\n',
        ].join(),
      );

  bool _hasJsonObjectReference(List<Class> allModels) => allModels.any((cls) =>
      cls.methods.any((m) => m.returns.toString().contains('JsonObject')));
}

/// Utility class for easier working with [BuilderOptions]
class BuiltJsonSchemaGeneratorOptions extends BuilderOptions {
  /// List of rules to add to the `ignore_for_file` comment
  final List<String> ignoreRules;

  /// Global default for [BuiltJsonSchema.docs]
  final List<String> docs;

  /// Global default for [BuiltJsonSchema.libraryDocs]
  final List<String> libraryDocs;

  /// Global default for [BuiltJsonSchema.path]
  final String path;

  /// Global default for [BuiltJsonSchema.json]
  final String json;

  /// Global default for [BuiltJsonSchema.key]
  final String key;

  /// Global default for [BuiltJsonSchema.typeName]
  final String typeName;

  /// Global default for [BuiltJsonSchema.version]
  final String version;

  /// Global default for [BuiltJsonSchema.definitionModels]
  final bool definitionModels;

  /// Global default for [BuiltJsonSchema.nestedModels]
  final bool nestedModels;

  /// Global default for [BuiltJsonSchema.generateValidators]
  final bool generateValidators;

  ///
  BuiltJsonSchemaGeneratorOptions({
    this.ignoreRules,
    this.docs,
    this.libraryDocs,
    this.path,
    this.json,
    this.key,
    this.typeName,
    this.version,
    this.definitionModels,
    this.nestedModels,
    this.generateValidators,
  }) : super({
          'ignoreRules': ignoreRules,
          'docs': docs,
          'libraryDocs': libraryDocs,
          'path': path,
          'json': json,
          'key': key,
          'typeName': typeName,
          'version': version,
          'definitionModels': definitionModels,
          'nestedModels': nestedModels,
          'generateValidators': generateValidators,
        });

  /// Helper to construct from [options]
  BuiltJsonSchemaGeneratorOptions.fromOptions(BuilderOptions options)
      : ignoreRules = options?.config['ignoreRules'] ?? [],
        docs = options?.config['docs'] ?? null,
        libraryDocs = options?.config['libraryDocs'] ?? null,
        path = options?.config['path'] ?? null,
        json = options?.config['json'] ?? null,
        key = options?.config['key'] ?? null,
        typeName = options?.config['typeName'] ?? null,
        version = options?.config['version'] ?? null,
        definitionModels = options?.config['definitionModels'] ?? false,
        nestedModels = options?.config['nestedModels'] ?? false,
        generateValidators = options?.config['generateValidators'] ?? false,
        super(options.config);
}

enum _DefaultKind { literal, builtList, enumClass, builtValue, jsonObject }
