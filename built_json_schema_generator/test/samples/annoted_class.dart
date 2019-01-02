library annoted_class;

import 'package:built_collection/built_collection.dart';
import 'package:built_json_schema/built_json_schema.dart';
import 'package:built_value/serializer.dart';

import 'annoted_class.model.dart';

export 'annoted_class.model.dart';

part 'annoted_class.g.dart';

void main() {
  print(Post());
}

@SerializersFor([Post])
final Serializers serializers = _$serializers;

/// Anything can be annoted
@BuiltJsonSchema.draftV4(
  path: 'schemas/wp-post-schema.json',
  typeName: 'Post',
  docs: <String>['A WordPress post object'],
  nestedModels: true,
  definitionModels: true,
)
class MyClass {}
