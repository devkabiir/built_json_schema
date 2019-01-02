/// Generate built_value models from json schema
library built_json_schema_generator;

import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_json_schema/built_json_schema.dart';
import 'package:code_builder/code_builder.dart' hide LibraryBuilder;
import 'package:dart_style/dart_style.dart';
import 'package:http/http.dart' as http;
import 'package:json_schema_dart2/json_schema.dart' as j;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

/// Include the part
part 'src/built_json_schema_generator_base.dart';

const String _addExtension = '.model';

/// Header of generated library
final String builtJsonSchemaHeader = [
  '/// GENERATED JSON SCHEMA MODEL',
  '/// DO NOT MODIFY',
  '',
].join('\n');

/// Logger for `built_json_schema_generator`
final Logger logger = Logger('built_json_schema_generator');

///
Builder buildJsonSchemaBuilder(BuilderOptions options) => LibraryBuilder(
      BuiltJsonSchemaGenerator(
          BuiltJsonSchemaGeneratorOptions.fromOptions(options)),
      generatedExtension: '$_addExtension.dart',
      header: builtJsonSchemaHeader,
    );
