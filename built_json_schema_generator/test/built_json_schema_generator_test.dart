import 'package:analyzer/dart/element/element.dart';
import 'package:build_test/build_test.dart';
import 'package:built_json_schema_generator/built_json_schema_generator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('built_json_schema_generator', () {
    setUp(() {
      // b.resolveAsset(b.makeAssetId(), );
    });

    test('fails for invalid key path', () async {
      /// Fails for invalid key path
      await generatorFails(
          annotate(
            'void main(){}',
            typeName: 'MyPostModel',
          ),
          jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(key: 'schemas'));
    });

    test('fails for invalid schema path', () async {
      /// Fails for invalid schema path
      await generatorFails(
          annotate(
            'void main(){}',
            typeName: 'MyPostModel',
            path: 'invalid/path.json',
          ),
          jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(key: 'schema'));
    });

    test('use builder options as last resort for unspecified config', () async {
      /// Fails for invalid schema path
      final modelSource = await generatorWorks(
          annotate(
            'void main(){}',
          ),
          jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(
            key: 'schema',
            typeName: 'MyPostModel',
          ));

      final model = modelSource
          .where((lib) => lib.name == 'post.model')
          .first
          .getType('MyPostModel');

      expect(
        model,
        isNotNull,
        reason: 'Model class was not generated',
      );
    });

    test('works for top level function', () async {
      final modelSource = await generatorWorks(
          annotate(
            'void main(){}',
            typeName: 'MyPostModel',
          ),
          jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(key: 'schema'));

      final model = modelSource
          .where((lib) => lib.name == 'post.model')
          .first
          .getType('MyPostModel');

      expect(
        model,
        isNotNull,
        reason: 'Model class was not generated',
      );

      expect(
        model.constructors,
        isNotEmpty,
        reason: 'Constructors not generated',
      );
      expect(model.constructors.length, equals(2),
          reason: 'Unexpectd number of constructors generated');

      expect(
        model.constructors.any((c) => c.isFactory),
        isTrue,
        reason: 'Factory constructor not generated',
      );
      expect(
        model.constructors.any((c) => c.name == '_'),
        isTrue,
        reason: 'Private constructor not generated',
      );
    });

    test('works for top level class', () async {
      final modelSource = await generatorWorks(
          annotate(
            'class MyClass {}',
            typeName: 'MyPostModel',
          ),
          jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(key: 'schema'));

      final model = modelSource
          .where((lib) => lib.name == 'post.model')
          .first
          .getType('MyPostModel');

      expect(
        model,
        isNotNull,
        reason: 'Model class was not generated',
      );
    });

    test('works for class child element', () async {
      final modelSource = await generatorWorks('''class MyClass {
              ${annotate('void methodName(){}', typeName: 'MyPostModel')}
            }''', jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(key: 'schema'));

      final model = modelSource
          .where((lib) => lib.name == 'post.model')
          .first
          .getType('MyPostModel');

      expect(
        model,
        isNotNull,
        reason: 'Model class was not generated',
      );
    });

    test('works for class with multi child element', () async {
      final modelSource = await generatorWorks('''class MyClass {
              ${annotate('void methodName(){}', typeName: 'MyPostModel')}

              ${annotate('void methodName2(){}', typeName: 'MyPostModel2')}
            }''', jsonSchemaV4Sample(),
          options: BuiltJsonSchemaGeneratorOptions(key: 'schema'));

      final model = modelSource
          .where((lib) => lib.name == 'post.model')
          .first
          .getType('MyPostModel');
      final model2 = modelSource
          .where((lib) => lib.name == 'post.model')
          .first
          .getType('MyPostModel2');

      expect(
        model,
        isNotNull,
        reason: 'Model class was not generated',
      );
      expect(
        model2,
        isNotNull,
        reason: 'Model class was not generated',
      );
    });
  });
}

// ignore_for_file: prefer_interpolation_to_compose_strings
const String builtJsonSchemaSource = r'''
/// Annotation to generate BuiltValue classes based on json schema
class BuiltJsonSchema {
  /// Public url or relative path to the `schema.json`
  ///
  final String path;

  /// Name of the generated class, this will also be used as the library name
  final String typeName;

  /// Any documentation for the generated class
  final List<String> docs;

  /// Any documentation for the generated library
  final List<String> libraryDocs;

  /// Json string, it will be decoded automatically
  final String json;

  /// THe version of schema to expect
  final String version;

  /// If specified a `BuiltValue` class will be generated for every object type
  /// in the json schema, otherwise `JsonObject` will be used.
  final bool nestedModels;

  /// Whether additional definitions should also have `BuiltValue` classes
  /// generated.
  ///
  /// These are the definitions which aren't used anywhere in the schema.
  /// You may only need to specify [nestedModels] for most use cases.
  final bool definitionModels;

  /// If a property has any validators, generate appropriate methods
  final bool generateValidators;

  /// Path to the key which contains `$schema` it should be seperated by
  /// `#` for nested keys, for instance `top_level#sub_level#level`, here
  /// `level` is expected to contain the actual schema.
  final String key;

  /// Annotation to generate `BuiltValue` classes based on json schema
  const BuiltJsonSchema({
    this.generateValidators,
    this.libraryDocs,
    this.nestedModels,
    this.definitionModels,
    this.path,
    this.typeName,
    this.key,
    this.docs,
    this.json,
    this.version,
  });

  /// Annotation to generate `BuiltValue` classes based on json schema
  /// version draft-04
  const BuiltJsonSchema.draftV4({
    this.generateValidators,
    this.libraryDocs,
    this.nestedModels,
    this.definitionModels,
    this.path,
    this.typeName,
    this.docs,
    this.key,
    this.json,
  }) : version = 'draft-04';

  /// Annotation to generate `BuiltValue` classes based on json schema
  /// version draft-06
  const BuiltJsonSchema.draftV6({
    this.generateValidators,
    this.libraryDocs,
    this.nestedModels,
    this.definitionModels,
    this.path,
    this.typeName,
    this.docs,
    this.key,
    this.json,
  }) : version = 'draft-06';

  /// Returns [uri] as a file path, if [uri] is not a file path
  /// returns `null`
  ///
  /// It **must** be a relative path to source dart file
  String get file {
    try {
      return uri.toFilePath(windows: false);
    }
    // ignore: avoid_catching_errors
    on UnsupportedError catch (_) {
      return null;
    }
  }

  /// Public url or relative path the `schema.json`
  Uri get uri => Uri.parse(path);

  /// Returns [uri] as a url, if [uri] is not a url
  /// returns `null`
  String get url =>
      (uri.hasScheme || uri.hasQuery || uri.hasPort) ? uri.toString() : null;
}


''';

const String pkgName = 'example_pkg';
final _emitter = DartEmitter();

/// Annotates given source with `BuiltJsonSchema`
String annotate(
  String source, {
  List<String> docs = const ['Generated model documentation'],
  List<String> libraryDocs = const ['Library documentation'],
  String path = 'schema.json',
  String json,
  String key,
  String typeName,
  String version = 'draft-v4',
  bool definitionModels = false,
  bool nestedModels = false,
  bool generateValidators = false,
}) =>
    [
      '@BuiltJsonSchema(',
      'path: ${literal(path).accept(_emitter)}',
      'typeName: ${literal(typeName).accept(_emitter)}',
      'docs: ${literal(docs).accept(_emitter)}',
      'libraryDocs: ${literal(libraryDocs).accept(_emitter)}',
      'json: ${literal(json).accept(_emitter)}',
      'key: ${literal(key).accept(_emitter)}',
      'version: ${literal(version).accept(_emitter)}',
      'definitionModels: ${literal(definitionModels).accept(_emitter)}',
      'nestedModels: ${literal(nestedModels).accept(_emitter)}',
      'generateValidators: ${literal(generateValidators).accept(_emitter)}',
      ')',
      source
    ].join('\n');

/// LogRecord or List<LibraryElement>
Future<dynamic> generate(String source, String schema,
    {BuiltJsonSchemaGeneratorOptions options}) async {
  final srcs = <String, String>{
    'built_json_schema|lib/built_json_schema.dart': builtJsonSchemaSource,
    '$pkgName|lib/post.dart': [
      "import 'package:built_json_schema/built_json_schema.dart';",
      source,
    ].join('\n'),
    '$pkgName|lib/schema.json': schema,
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  LogRecord error;
  void captureError(LogRecord logRecord) {
    if (logRecord.error != null ||
        logRecord.error is InvalidGenerationSourceError) {
      if (error != null) {
        throw StateError('Expected at most one error.${log2String(error)}');
      }
      error = logRecord;
    }
  }

  final writer = InMemoryAssetWriter();
  await testBuilder(buildJsonSchemaBuilder(options), srcs,
      rootPackage: pkgName, writer: writer, onLog: captureError);

  if (error != null) {
    return error;
  }

  final libraries = <LibraryElement>[];
  for (var source in writer.assets.values) {
    libraries.addAll(await resolveSource(
        String.fromCharCodes(source), (r) async => await r.libraries.toList()));
  }

  return libraries;
}

/// Expect builder to fail
Future<LogRecord> generatorFails(String source, String schema,
    {BuiltJsonSchemaGeneratorOptions options}) async {
  final result = await generate(source, schema, options: options);
  expect(
    result,
    const TypeMatcher<LogRecord>(),
    reason: 'Expected to fail\n$result',
  );
  return result;
}

/// Expect builder to work
Future<List<LibraryElement>> generatorWorks(String source, String schema,
    {BuiltJsonSchemaGeneratorOptions options}) async {
  final result = await generate(source, schema, options: options);
  expect(
    result,
    const TypeMatcher<List<LibraryElement>>(),
    reason:
        'Expected to work${result is LogRecord ? log2String(result) : result}',
  );
  return result;
}

String jsonSchemaV4Sample() => r'''
{
"schema": {
  "$schema"   : "http:\/\/json-schema.org\/draft-04\/schema#",
  "title"     : "post",
  "type"      : "object",
  "properties": {
    "date": {
      "description": "The date the object was published, in the site's timezone.",
      "type"       : "string",
      "format"     : "date-time",
      "context"    : [
        "view",
        "edit",
        "embed"
      ]
    },
    "guid": {
      "description": "The globally unique identifier for the object.",
      "type"       : "object",
      "context"    : [
        "view",
        "edit"
      ],
      "readonly"  : true,
      "properties": {
        "raw": {
          "description": "GUID for the object, as it exists in the database.",
          "type"       : "string",
          "context"    : [
            "edit"
          ],
          "readonly": true
        },
        "rendered": {
          "description": "GUID for the object, transformed for display.",
          "type"       : "string",
          "context"    : [
            "view",
            "edit"
          ],
          "readonly": true
        }
      }
    },
    "id": {
      "description": "Unique identifier for the object.",
      "type"       : "integer",
      "context"    : [
        "view",
        "edit",
        "embed"
      ],
      "readonly": true
    },
    "link": {
      "description": "URL to the object.",
      "type"       : "string",
      "format"     : "uri",
      "context"    : [
        "view",
        "edit",
        "embed"
      ],
      "readonly": true
    },
    "status": {
      "description": "A named status for the object.",
      "type"       : "string",
      "enum"       : [
        "publish",
        "future",
        "draft",
        "pending",
        "private"
      ],
      "context": [
        "view",
        "edit"
      ]
    },
    "categories": {
      "description": "The terms assigned to the object in the category taxonomy.",
      "type"       : "array",
      "items"      : {
        "type": "integer"
      },
      "context": [
        "view",
        "edit"
      ]
    }
  }
}
}

      ''';

String log2String(LogRecord error) => '\n$error\n${error.error}'
    '${error.loggerName}:${error.stackTrace}';
