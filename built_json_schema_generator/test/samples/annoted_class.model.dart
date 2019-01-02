/// GENERATED JSON SCHEMA MODEL
/// DO NOT MODIFY

// **************************************************************************
// BuiltJsonSchemaGenerator
// **************************************************************************

library annoted_class.model;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/json_object.dart';
part 'annoted_class.model.g.dart';

/// My Custom Date Definition
abstract class CustomDate implements Built<CustomDate, CustomDateBuilder> {
  CustomDate._();

  /// Instantiates a [CustomDate] object with defaults
  /// set for each property, applies [updates] if specified
  factory CustomDate([void updates(CustomDateBuilder b)]) =>
      _$CustomDate((b) => b

        /// Defaults are set using the default value from the schema

        ..update(updates));

  /// The date the object was published, in the site's timezone.
  @nullable
  DateTime get date;

  /// Used for serializing and deserializing [CustomDate] data
  static Serializer<CustomDate> get serializer => _$customDateSerializer;
}

/// A WordPress post object
abstract class Post implements Built<Post, PostBuilder> {
  Post._();

  /// Instantiates a [Post] object with defaults
  /// set for each property, applies [updates] if specified
  factory Post([void updates(PostBuilder b)]) => _$Post((b) => b

    /// Defaults are set using the default value from the schema
    ..id = -1
    ..link = 'http://example.com/path/object'
    ..status = PostStatus.publishTo
    ..categories = (BuiltList<int>().toBuilder()..addAll([1, 2, 3]))
    ..update(updates));

  /// The date the object was published, as GMT.
  @nullable
  @BuiltValue(wireName: 'date_gmt')
  DateTime get dateGmt;

  /// The globally unique identifier for the object.
  @nullable
  PostGuid get guid;

  /// Unique identifier for the object.
  @nullable
  int get id;

  /// URL to the object.
  @nullable
  String get link;

  /// The date the object was last modified, in the site's timezone.
  @nullable
  DateTime get modified;

  /// The date the object was last modified, as GMT.
  @nullable
  @BuiltValue(wireName: 'modified_gmt')
  DateTime get modifiedGmt;

  /// An alphanumeric identifier for the object unique to its type.
  @nullable
  String get slug;

  /// A named status for the object.
  @nullable
  PostStatus get status;

  /// Type of Post for the object.
  @nullable
  String get type;

  /// A password to protect access to the content and excerpt.
  @nullable
  String get password;

  /// The title for the object.
  @nullable
  PostTitle get title;

  /// The content for the object.
  @nullable
  PostContent get content;

  /// The ID for the author of the object.
  @nullable
  int get author;

  /// The excerpt for the object.
  @nullable
  PostExcerpt get excerpt;

  /// The ID of the featured media for the object.
  @nullable
  @BuiltValue(wireName: 'featured_media')
  int get featuredMedia;

  /// Whether or not comments are open on the object.
  @nullable
  @BuiltValue(wireName: 'comment_status')
  PostCommentStatus get commentStatus;

  /// Whether or not the object can be pinged.
  @nullable
  @BuiltValue(wireName: 'ping_status')
  PostPingStatus get pingStatus;

  /// The format for the object.
  @nullable
  PostFormat get format;

  /// Meta fields.
  @nullable
  JsonObject get meta;

  /// Whether or not the object should be treated as sticky.
  @nullable
  bool get sticky;

  /// The theme file to use to display the object.
  @nullable
  String get template;

  /// The terms assigned to the object in the category taxonomy.
  @nullable
  BuiltList<int> get categories;

  /// The terms assigned to the object in the post_tag taxonomy.
  @nullable
  BuiltList<int> get tags;

  /// My Custom Date Definition
  @nullable
  CustomDate get date;

  /// Used for serializing and deserializing [Post] data
  static Serializer<Post> get serializer => _$postSerializer;
}

/// The globally unique identifier for the object.
abstract class PostGuid implements Built<PostGuid, PostGuidBuilder> {
  PostGuid._();

  /// Instantiates a [PostGuid] object with defaults
  /// set for each property, applies [updates] if specified
  factory PostGuid([void updates(PostGuidBuilder b)]) => _$PostGuid((b) => b

    /// Defaults are set using the default value from the schema

    ..update(updates));

  /// GUID for the object, as it exists in the database.
  @nullable
  String get raw;

  /// GUID for the object, transformed for display.
  @nullable
  String get rendered;

  /// Used for serializing and deserializing [PostGuid] data
  static Serializer<PostGuid> get serializer => _$postGuidSerializer;
}

/// A named status for the object.
class PostStatus extends EnumClass {
  const PostStatus._(String name) : super(name);

  /// [PostStatus] instance holding value `publish_to`
  @BuiltValueEnumConst(wireName: 'publish_to')
  static const PostStatus publishTo = _$PostStatusPublishTo;

  /// [PostStatus] instance holding value `future`
  static const PostStatus future = _$PostStatusFuture;

  /// [PostStatus] instance holding value `draft`
  static const PostStatus draft = _$PostStatusDraft;

  /// [PostStatus] instance holding value `pending`
  static const PostStatus pending = _$PostStatusPending;

  /// [PostStatus] instance holding value `private`
  static const PostStatus private = _$PostStatusPrivate;

  /// Used for serializing and deserializing [PostStatus] data
  static Serializer<PostStatus> get serializer => _$postStatusSerializer;

  /// Set of all available values for [PostStatus]
  static BuiltSet<PostStatus> get values => _$postStatusValues;

  /// Returns an instance of [PostStatus] which holds [name]
  static PostStatus valueOf(String name) => _$postStatusValueOf(name);
}

/// The title for the object.
abstract class PostTitle implements Built<PostTitle, PostTitleBuilder> {
  PostTitle._();

  /// Instantiates a [PostTitle] object with defaults
  /// set for each property, applies [updates] if specified
  factory PostTitle([void updates(PostTitleBuilder b)]) => _$PostTitle((b) => b

    /// Defaults are set using the default value from the schema

    ..update(updates));

  /// Title for the object, as it exists in the database.
  @nullable
  String get raw;

  /// HTML title for the object, transformed for display.
  @nullable
  String get rendered;

  /// Used for serializing and deserializing [PostTitle] data
  static Serializer<PostTitle> get serializer => _$postTitleSerializer;
}

/// The content for the object.
abstract class PostContent implements Built<PostContent, PostContentBuilder> {
  PostContent._();

  /// Instantiates a [PostContent] object with defaults
  /// set for each property, applies [updates] if specified
  factory PostContent([void updates(PostContentBuilder b)]) =>
      _$PostContent((b) => b

        /// Defaults are set using the default value from the schema

        ..update(updates));

  /// Content for the object, as it exists in the database.
  @nullable
  String get raw;

  /// HTML content for the object, transformed for display.
  @nullable
  String get rendered;

  /// Whether the content is protected with a password.
  @nullable
  bool get protected;

  /// Used for serializing and deserializing [PostContent] data
  static Serializer<PostContent> get serializer => _$postContentSerializer;
}

/// The excerpt for the object.
abstract class PostExcerpt implements Built<PostExcerpt, PostExcerptBuilder> {
  PostExcerpt._();

  /// Instantiates a [PostExcerpt] object with defaults
  /// set for each property, applies [updates] if specified
  factory PostExcerpt([void updates(PostExcerptBuilder b)]) =>
      _$PostExcerpt((b) => b

        /// Defaults are set using the default value from the schema
        ..raw = 'this is the default raw excerpt'
        ..update(updates));

  /// Excerpt for the object, as it exists in the database.
  @nullable
  String get raw;

  /// HTML excerpt for the object, transformed for display.
  @nullable
  String get rendered;

  /// Whether the excerpt is protected with a password.
  @nullable
  bool get protected;

  /// Used for serializing and deserializing [PostExcerpt] data
  static Serializer<PostExcerpt> get serializer => _$postExcerptSerializer;
}

/// Whether or not comments are open on the object.
class PostCommentStatus extends EnumClass {
  const PostCommentStatus._(String name) : super(name);

  /// [PostCommentStatus] instance holding value `open`
  static const PostCommentStatus open = _$PostCommentStatusOpen;

  /// [PostCommentStatus] instance holding value `closed`
  static const PostCommentStatus closed = _$PostCommentStatusClosed;

  /// Used for serializing and deserializing [PostCommentStatus] data
  static Serializer<PostCommentStatus> get serializer =>
      _$postCommentStatusSerializer;

  /// Set of all available values for [PostCommentStatus]
  static BuiltSet<PostCommentStatus> get values => _$postCommentStatusValues;

  /// Returns an instance of [PostCommentStatus] which holds [name]
  static PostCommentStatus valueOf(String name) =>
      _$postCommentStatusValueOf(name);
}

/// Whether or not the object can be pinged.
class PostPingStatus extends EnumClass {
  const PostPingStatus._(String name) : super(name);

  /// [PostPingStatus] instance holding value `open`
  static const PostPingStatus open = _$PostPingStatusOpen;

  /// [PostPingStatus] instance holding value `closed`
  static const PostPingStatus closed = _$PostPingStatusClosed;

  /// Used for serializing and deserializing [PostPingStatus] data
  static Serializer<PostPingStatus> get serializer =>
      _$postPingStatusSerializer;

  /// Set of all available values for [PostPingStatus]
  static BuiltSet<PostPingStatus> get values => _$postPingStatusValues;

  /// Returns an instance of [PostPingStatus] which holds [name]
  static PostPingStatus valueOf(String name) => _$postPingStatusValueOf(name);
}

/// The format for the object.
class PostFormat extends EnumClass {
  const PostFormat._(String name) : super(name);

  /// [PostFormat] instance holding value `standard`
  static const PostFormat standard = _$PostFormatStandard;

  /// [PostFormat] instance holding value `aside`
  static const PostFormat aside = _$PostFormatAside;

  /// [PostFormat] instance holding value `chat`
  static const PostFormat chat = _$PostFormatChat;

  /// [PostFormat] instance holding value `gallery`
  static const PostFormat gallery = _$PostFormatGallery;

  /// [PostFormat] instance holding value `link`
  static const PostFormat link = _$PostFormatLink;

  /// [PostFormat] instance holding value `image`
  static const PostFormat image = _$PostFormatImage;

  /// [PostFormat] instance holding value `quote`
  static const PostFormat quote = _$PostFormatQuote;

  /// [PostFormat] instance holding value `status`
  static const PostFormat status = _$PostFormatStatus;

  /// [PostFormat] instance holding value `video`
  static const PostFormat video = _$PostFormatVideo;

  /// [PostFormat] instance holding value `audio`
  static const PostFormat audio = _$PostFormatAudio;

  /// Used for serializing and deserializing [PostFormat] data
  static Serializer<PostFormat> get serializer => _$postFormatSerializer;

  /// Set of all available values for [PostFormat]
  static BuiltSet<PostFormat> get values => _$postFormatValues;

  /// Returns an instance of [PostFormat] which holds [name]
  static PostFormat valueOf(String name) => _$postFormatValueOf(name);
}

// ignore_for_file: avoid_as, sort_constructors_first, sort_unnamed_constructors_first, lines_longer_than_80_chars
