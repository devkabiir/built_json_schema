/// Built json schema annotations
part of built_json_schema;

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
