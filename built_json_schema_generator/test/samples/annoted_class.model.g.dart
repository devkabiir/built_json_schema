// GENERATED CODE - DO NOT MODIFY BY HAND

part of annoted_class.model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PostStatus _$PostStatusPublishTo = const PostStatus._('publishTo');
const PostStatus _$PostStatusFuture = const PostStatus._('future');
const PostStatus _$PostStatusDraft = const PostStatus._('draft');
const PostStatus _$PostStatusPending = const PostStatus._('pending');
const PostStatus _$PostStatusPrivate = const PostStatus._('private');

PostStatus _$postStatusValueOf(String name) {
  switch (name) {
    case 'publishTo':
      return _$PostStatusPublishTo;
    case 'future':
      return _$PostStatusFuture;
    case 'draft':
      return _$PostStatusDraft;
    case 'pending':
      return _$PostStatusPending;
    case 'private':
      return _$PostStatusPrivate;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PostStatus> _$postStatusValues =
    new BuiltSet<PostStatus>(const <PostStatus>[
  _$PostStatusPublishTo,
  _$PostStatusFuture,
  _$PostStatusDraft,
  _$PostStatusPending,
  _$PostStatusPrivate,
]);

const PostCommentStatus _$PostCommentStatusOpen =
    const PostCommentStatus._('open');
const PostCommentStatus _$PostCommentStatusClosed =
    const PostCommentStatus._('closed');

PostCommentStatus _$postCommentStatusValueOf(String name) {
  switch (name) {
    case 'open':
      return _$PostCommentStatusOpen;
    case 'closed':
      return _$PostCommentStatusClosed;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PostCommentStatus> _$postCommentStatusValues =
    new BuiltSet<PostCommentStatus>(const <PostCommentStatus>[
  _$PostCommentStatusOpen,
  _$PostCommentStatusClosed,
]);

const PostPingStatus _$PostPingStatusOpen = const PostPingStatus._('open');
const PostPingStatus _$PostPingStatusClosed = const PostPingStatus._('closed');

PostPingStatus _$postPingStatusValueOf(String name) {
  switch (name) {
    case 'open':
      return _$PostPingStatusOpen;
    case 'closed':
      return _$PostPingStatusClosed;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PostPingStatus> _$postPingStatusValues =
    new BuiltSet<PostPingStatus>(const <PostPingStatus>[
  _$PostPingStatusOpen,
  _$PostPingStatusClosed,
]);

const PostFormat _$PostFormatStandard = const PostFormat._('standard');
const PostFormat _$PostFormatAside = const PostFormat._('aside');
const PostFormat _$PostFormatChat = const PostFormat._('chat');
const PostFormat _$PostFormatGallery = const PostFormat._('gallery');
const PostFormat _$PostFormatLink = const PostFormat._('link');
const PostFormat _$PostFormatImage = const PostFormat._('image');
const PostFormat _$PostFormatQuote = const PostFormat._('quote');
const PostFormat _$PostFormatStatus = const PostFormat._('status');
const PostFormat _$PostFormatVideo = const PostFormat._('video');
const PostFormat _$PostFormatAudio = const PostFormat._('audio');

PostFormat _$postFormatValueOf(String name) {
  switch (name) {
    case 'standard':
      return _$PostFormatStandard;
    case 'aside':
      return _$PostFormatAside;
    case 'chat':
      return _$PostFormatChat;
    case 'gallery':
      return _$PostFormatGallery;
    case 'link':
      return _$PostFormatLink;
    case 'image':
      return _$PostFormatImage;
    case 'quote':
      return _$PostFormatQuote;
    case 'status':
      return _$PostFormatStatus;
    case 'video':
      return _$PostFormatVideo;
    case 'audio':
      return _$PostFormatAudio;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PostFormat> _$postFormatValues =
    new BuiltSet<PostFormat>(const <PostFormat>[
  _$PostFormatStandard,
  _$PostFormatAside,
  _$PostFormatChat,
  _$PostFormatGallery,
  _$PostFormatLink,
  _$PostFormatImage,
  _$PostFormatQuote,
  _$PostFormatStatus,
  _$PostFormatVideo,
  _$PostFormatAudio,
]);

Serializer<CustomDate> _$customDateSerializer = new _$CustomDateSerializer();
Serializer<Post> _$postSerializer = new _$PostSerializer();
Serializer<PostGuid> _$postGuidSerializer = new _$PostGuidSerializer();
Serializer<PostStatus> _$postStatusSerializer = new _$PostStatusSerializer();
Serializer<PostTitle> _$postTitleSerializer = new _$PostTitleSerializer();
Serializer<PostContent> _$postContentSerializer = new _$PostContentSerializer();
Serializer<PostExcerpt> _$postExcerptSerializer = new _$PostExcerptSerializer();
Serializer<PostCommentStatus> _$postCommentStatusSerializer =
    new _$PostCommentStatusSerializer();
Serializer<PostPingStatus> _$postPingStatusSerializer =
    new _$PostPingStatusSerializer();
Serializer<PostFormat> _$postFormatSerializer = new _$PostFormatSerializer();

class _$CustomDateSerializer implements StructuredSerializer<CustomDate> {
  @override
  final Iterable<Type> types = const [CustomDate, _$CustomDate];
  @override
  final String wireName = 'CustomDate';

  @override
  Iterable serialize(Serializers serializers, CustomDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(DateTime)));
    }

    return result;
  }

  @override
  CustomDate deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.dateGmt != null) {
      result
        ..add('dateGmt')
        ..add(serializers.serialize(object.dateGmt,
            specifiedType: const FullType(DateTime)));
    }
    if (object.guid != null) {
      result
        ..add('guid')
        ..add(serializers.serialize(object.guid,
            specifiedType: const FullType(PostGuid)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.link != null) {
      result
        ..add('link')
        ..add(serializers.serialize(object.link,
            specifiedType: const FullType(String)));
    }
    if (object.modified != null) {
      result
        ..add('modified')
        ..add(serializers.serialize(object.modified,
            specifiedType: const FullType(DateTime)));
    }
    if (object.modifiedGmt != null) {
      result
        ..add('modifiedGmt')
        ..add(serializers.serialize(object.modifiedGmt,
            specifiedType: const FullType(DateTime)));
    }
    if (object.slug != null) {
      result
        ..add('slug')
        ..add(serializers.serialize(object.slug,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(PostStatus)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(PostTitle)));
    }
    if (object.content != null) {
      result
        ..add('content')
        ..add(serializers.serialize(object.content,
            specifiedType: const FullType(PostContent)));
    }
    if (object.author != null) {
      result
        ..add('author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(int)));
    }
    if (object.excerpt != null) {
      result
        ..add('excerpt')
        ..add(serializers.serialize(object.excerpt,
            specifiedType: const FullType(PostExcerpt)));
    }
    if (object.featuredMedia != null) {
      result
        ..add('featuredMedia')
        ..add(serializers.serialize(object.featuredMedia,
            specifiedType: const FullType(int)));
    }
    if (object.commentStatus != null) {
      result
        ..add('commentStatus')
        ..add(serializers.serialize(object.commentStatus,
            specifiedType: const FullType(PostCommentStatus)));
    }
    if (object.pingStatus != null) {
      result
        ..add('pingStatus')
        ..add(serializers.serialize(object.pingStatus,
            specifiedType: const FullType(PostPingStatus)));
    }
    if (object.format != null) {
      result
        ..add('format')
        ..add(serializers.serialize(object.format,
            specifiedType: const FullType(PostFormat)));
    }
    if (object.meta != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(object.meta,
            specifiedType: const FullType(JsonObject)));
    }
    if (object.sticky != null) {
      result
        ..add('sticky')
        ..add(serializers.serialize(object.sticky,
            specifiedType: const FullType(bool)));
    }
    if (object.template != null) {
      result
        ..add('template')
        ..add(serializers.serialize(object.template,
            specifiedType: const FullType(String)));
    }
    if (object.categories != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(object.categories,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(CustomDate)));
    }

    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'dateGmt':
          result.dateGmt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'guid':
          result.guid.replace(serializers.deserialize(value,
              specifiedType: const FullType(PostGuid)) as PostGuid);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'modified':
          result.modified = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'modifiedGmt':
          result.modifiedGmt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(PostStatus)) as PostStatus;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title.replace(serializers.deserialize(value,
              specifiedType: const FullType(PostTitle)) as PostTitle);
          break;
        case 'content':
          result.content.replace(serializers.deserialize(value,
              specifiedType: const FullType(PostContent)) as PostContent);
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'excerpt':
          result.excerpt.replace(serializers.deserialize(value,
              specifiedType: const FullType(PostExcerpt)) as PostExcerpt);
          break;
        case 'featuredMedia':
          result.featuredMedia = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'commentStatus':
          result.commentStatus = serializers.deserialize(value,
                  specifiedType: const FullType(PostCommentStatus))
              as PostCommentStatus;
          break;
        case 'pingStatus':
          result.pingStatus = serializers.deserialize(value,
              specifiedType: const FullType(PostPingStatus)) as PostPingStatus;
          break;
        case 'format':
          result.format = serializers.deserialize(value,
              specifiedType: const FullType(PostFormat)) as PostFormat;
          break;
        case 'meta':
          result.meta = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject;
          break;
        case 'sticky':
          result.sticky = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'template':
          result.template = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'date':
          result.date.replace(serializers.deserialize(value,
              specifiedType: const FullType(CustomDate)) as CustomDate);
          break;
      }
    }

    return result.build();
  }
}

class _$PostGuidSerializer implements StructuredSerializer<PostGuid> {
  @override
  final Iterable<Type> types = const [PostGuid, _$PostGuid];
  @override
  final String wireName = 'PostGuid';

  @override
  Iterable serialize(Serializers serializers, PostGuid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.raw != null) {
      result
        ..add('raw')
        ..add(serializers.serialize(object.raw,
            specifiedType: const FullType(String)));
    }
    if (object.rendered != null) {
      result
        ..add('rendered')
        ..add(serializers.serialize(object.rendered,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  PostGuid deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostGuidBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'raw':
          result.raw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rendered':
          result.rendered = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostStatusSerializer implements PrimitiveSerializer<PostStatus> {
  static const Map<String, String> _toWire = const <String, String>{
    'publishTo': 'publish_to',
  };
  static const Map<String, String> _fromWire = const <String, String>{
    'publish_to': 'publishTo',
  };

  @override
  final Iterable<Type> types = const <Type>[PostStatus];
  @override
  final String wireName = 'PostStatus';

  @override
  Object serialize(Serializers serializers, PostStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PostStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PostStatus.valueOf(_fromWire[serialized] ?? serialized as String);
}

class _$PostTitleSerializer implements StructuredSerializer<PostTitle> {
  @override
  final Iterable<Type> types = const [PostTitle, _$PostTitle];
  @override
  final String wireName = 'PostTitle';

  @override
  Iterable serialize(Serializers serializers, PostTitle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.raw != null) {
      result
        ..add('raw')
        ..add(serializers.serialize(object.raw,
            specifiedType: const FullType(String)));
    }
    if (object.rendered != null) {
      result
        ..add('rendered')
        ..add(serializers.serialize(object.rendered,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  PostTitle deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostTitleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'raw':
          result.raw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rendered':
          result.rendered = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostContentSerializer implements StructuredSerializer<PostContent> {
  @override
  final Iterable<Type> types = const [PostContent, _$PostContent];
  @override
  final String wireName = 'PostContent';

  @override
  Iterable serialize(Serializers serializers, PostContent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.raw != null) {
      result
        ..add('raw')
        ..add(serializers.serialize(object.raw,
            specifiedType: const FullType(String)));
    }
    if (object.rendered != null) {
      result
        ..add('rendered')
        ..add(serializers.serialize(object.rendered,
            specifiedType: const FullType(String)));
    }
    if (object.protected != null) {
      result
        ..add('protected')
        ..add(serializers.serialize(object.protected,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  PostContent deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostContentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'raw':
          result.raw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rendered':
          result.rendered = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'protected':
          result.protected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PostExcerptSerializer implements StructuredSerializer<PostExcerpt> {
  @override
  final Iterable<Type> types = const [PostExcerpt, _$PostExcerpt];
  @override
  final String wireName = 'PostExcerpt';

  @override
  Iterable serialize(Serializers serializers, PostExcerpt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.raw != null) {
      result
        ..add('raw')
        ..add(serializers.serialize(object.raw,
            specifiedType: const FullType(String)));
    }
    if (object.rendered != null) {
      result
        ..add('rendered')
        ..add(serializers.serialize(object.rendered,
            specifiedType: const FullType(String)));
    }
    if (object.protected != null) {
      result
        ..add('protected')
        ..add(serializers.serialize(object.protected,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  PostExcerpt deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostExcerptBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'raw':
          result.raw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rendered':
          result.rendered = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'protected':
          result.protected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PostCommentStatusSerializer
    implements PrimitiveSerializer<PostCommentStatus> {
  @override
  final Iterable<Type> types = const <Type>[PostCommentStatus];
  @override
  final String wireName = 'PostCommentStatus';

  @override
  Object serialize(Serializers serializers, PostCommentStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PostCommentStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PostCommentStatus.valueOf(serialized as String);
}

class _$PostPingStatusSerializer
    implements PrimitiveSerializer<PostPingStatus> {
  @override
  final Iterable<Type> types = const <Type>[PostPingStatus];
  @override
  final String wireName = 'PostPingStatus';

  @override
  Object serialize(Serializers serializers, PostPingStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PostPingStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PostPingStatus.valueOf(serialized as String);
}

class _$PostFormatSerializer implements PrimitiveSerializer<PostFormat> {
  @override
  final Iterable<Type> types = const <Type>[PostFormat];
  @override
  final String wireName = 'PostFormat';

  @override
  Object serialize(Serializers serializers, PostFormat object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PostFormat deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PostFormat.valueOf(serialized as String);
}

class _$CustomDate extends CustomDate {
  @override
  final DateTime date;

  factory _$CustomDate([void updates(CustomDateBuilder b)]) =>
      (new CustomDateBuilder()..update(updates)).build();

  _$CustomDate._({this.date}) : super._();

  @override
  CustomDate rebuild(void updates(CustomDateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomDateBuilder toBuilder() => new CustomDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomDate && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomDate')..add('date', date))
        .toString();
  }
}

class CustomDateBuilder implements Builder<CustomDate, CustomDateBuilder> {
  _$CustomDate _$v;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  CustomDateBuilder();

  CustomDateBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomDate other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomDate;
  }

  @override
  void update(void updates(CustomDateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomDate build() {
    final _$result = _$v ?? new _$CustomDate._(date: date);
    replace(_$result);
    return _$result;
  }
}

class _$Post extends Post {
  @override
  final DateTime dateGmt;
  @override
  final PostGuid guid;
  @override
  final int id;
  @override
  final String link;
  @override
  final DateTime modified;
  @override
  final DateTime modifiedGmt;
  @override
  final String slug;
  @override
  final PostStatus status;
  @override
  final String type;
  @override
  final String password;
  @override
  final PostTitle title;
  @override
  final PostContent content;
  @override
  final int author;
  @override
  final PostExcerpt excerpt;
  @override
  final int featuredMedia;
  @override
  final PostCommentStatus commentStatus;
  @override
  final PostPingStatus pingStatus;
  @override
  final PostFormat format;
  @override
  final JsonObject meta;
  @override
  final bool sticky;
  @override
  final String template;
  @override
  final BuiltList<int> categories;
  @override
  final BuiltList<int> tags;
  @override
  final CustomDate date;

  factory _$Post([void updates(PostBuilder b)]) =>
      (new PostBuilder()..update(updates)).build();

  _$Post._(
      {this.dateGmt,
      this.guid,
      this.id,
      this.link,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.type,
      this.password,
      this.title,
      this.content,
      this.author,
      this.excerpt,
      this.featuredMedia,
      this.commentStatus,
      this.pingStatus,
      this.format,
      this.meta,
      this.sticky,
      this.template,
      this.categories,
      this.tags,
      this.date})
      : super._();

  @override
  Post rebuild(void updates(PostBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        dateGmt == other.dateGmt &&
        guid == other.guid &&
        id == other.id &&
        link == other.link &&
        modified == other.modified &&
        modifiedGmt == other.modifiedGmt &&
        slug == other.slug &&
        status == other.status &&
        type == other.type &&
        password == other.password &&
        title == other.title &&
        content == other.content &&
        author == other.author &&
        excerpt == other.excerpt &&
        featuredMedia == other.featuredMedia &&
        commentStatus == other.commentStatus &&
        pingStatus == other.pingStatus &&
        format == other.format &&
        meta == other.meta &&
        sticky == other.sticky &&
        template == other.template &&
        categories == other.categories &&
        tags == other.tags &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc(0, dateGmt.hashCode), guid.hashCode), id.hashCode), link.hashCode), modified.hashCode),
                                                                                modifiedGmt.hashCode),
                                                                            slug.hashCode),
                                                                        status.hashCode),
                                                                    type.hashCode),
                                                                password.hashCode),
                                                            title.hashCode),
                                                        content.hashCode),
                                                    author.hashCode),
                                                excerpt.hashCode),
                                            featuredMedia.hashCode),
                                        commentStatus.hashCode),
                                    pingStatus.hashCode),
                                format.hashCode),
                            meta.hashCode),
                        sticky.hashCode),
                    template.hashCode),
                categories.hashCode),
            tags.hashCode),
        date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Post')
          ..add('dateGmt', dateGmt)
          ..add('guid', guid)
          ..add('id', id)
          ..add('link', link)
          ..add('modified', modified)
          ..add('modifiedGmt', modifiedGmt)
          ..add('slug', slug)
          ..add('status', status)
          ..add('type', type)
          ..add('password', password)
          ..add('title', title)
          ..add('content', content)
          ..add('author', author)
          ..add('excerpt', excerpt)
          ..add('featuredMedia', featuredMedia)
          ..add('commentStatus', commentStatus)
          ..add('pingStatus', pingStatus)
          ..add('format', format)
          ..add('meta', meta)
          ..add('sticky', sticky)
          ..add('template', template)
          ..add('categories', categories)
          ..add('tags', tags)
          ..add('date', date))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post _$v;

  DateTime _dateGmt;
  DateTime get dateGmt => _$this._dateGmt;
  set dateGmt(DateTime dateGmt) => _$this._dateGmt = dateGmt;

  PostGuidBuilder _guid;
  PostGuidBuilder get guid => _$this._guid ??= new PostGuidBuilder();
  set guid(PostGuidBuilder guid) => _$this._guid = guid;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  DateTime _modified;
  DateTime get modified => _$this._modified;
  set modified(DateTime modified) => _$this._modified = modified;

  DateTime _modifiedGmt;
  DateTime get modifiedGmt => _$this._modifiedGmt;
  set modifiedGmt(DateTime modifiedGmt) => _$this._modifiedGmt = modifiedGmt;

  String _slug;
  String get slug => _$this._slug;
  set slug(String slug) => _$this._slug = slug;

  PostStatus _status;
  PostStatus get status => _$this._status;
  set status(PostStatus status) => _$this._status = status;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  PostTitleBuilder _title;
  PostTitleBuilder get title => _$this._title ??= new PostTitleBuilder();
  set title(PostTitleBuilder title) => _$this._title = title;

  PostContentBuilder _content;
  PostContentBuilder get content =>
      _$this._content ??= new PostContentBuilder();
  set content(PostContentBuilder content) => _$this._content = content;

  int _author;
  int get author => _$this._author;
  set author(int author) => _$this._author = author;

  PostExcerptBuilder _excerpt;
  PostExcerptBuilder get excerpt =>
      _$this._excerpt ??= new PostExcerptBuilder();
  set excerpt(PostExcerptBuilder excerpt) => _$this._excerpt = excerpt;

  int _featuredMedia;
  int get featuredMedia => _$this._featuredMedia;
  set featuredMedia(int featuredMedia) => _$this._featuredMedia = featuredMedia;

  PostCommentStatus _commentStatus;
  PostCommentStatus get commentStatus => _$this._commentStatus;
  set commentStatus(PostCommentStatus commentStatus) =>
      _$this._commentStatus = commentStatus;

  PostPingStatus _pingStatus;
  PostPingStatus get pingStatus => _$this._pingStatus;
  set pingStatus(PostPingStatus pingStatus) => _$this._pingStatus = pingStatus;

  PostFormat _format;
  PostFormat get format => _$this._format;
  set format(PostFormat format) => _$this._format = format;

  JsonObject _meta;
  JsonObject get meta => _$this._meta;
  set meta(JsonObject meta) => _$this._meta = meta;

  bool _sticky;
  bool get sticky => _$this._sticky;
  set sticky(bool sticky) => _$this._sticky = sticky;

  String _template;
  String get template => _$this._template;
  set template(String template) => _$this._template = template;

  ListBuilder<int> _categories;
  ListBuilder<int> get categories =>
      _$this._categories ??= new ListBuilder<int>();
  set categories(ListBuilder<int> categories) =>
      _$this._categories = categories;

  ListBuilder<int> _tags;
  ListBuilder<int> get tags => _$this._tags ??= new ListBuilder<int>();
  set tags(ListBuilder<int> tags) => _$this._tags = tags;

  CustomDateBuilder _date;
  CustomDateBuilder get date => _$this._date ??= new CustomDateBuilder();
  set date(CustomDateBuilder date) => _$this._date = date;

  PostBuilder();

  PostBuilder get _$this {
    if (_$v != null) {
      _dateGmt = _$v.dateGmt;
      _guid = _$v.guid?.toBuilder();
      _id = _$v.id;
      _link = _$v.link;
      _modified = _$v.modified;
      _modifiedGmt = _$v.modifiedGmt;
      _slug = _$v.slug;
      _status = _$v.status;
      _type = _$v.type;
      _password = _$v.password;
      _title = _$v.title?.toBuilder();
      _content = _$v.content?.toBuilder();
      _author = _$v.author;
      _excerpt = _$v.excerpt?.toBuilder();
      _featuredMedia = _$v.featuredMedia;
      _commentStatus = _$v.commentStatus;
      _pingStatus = _$v.pingStatus;
      _format = _$v.format;
      _meta = _$v.meta;
      _sticky = _$v.sticky;
      _template = _$v.template;
      _categories = _$v.categories?.toBuilder();
      _tags = _$v.tags?.toBuilder();
      _date = _$v.date?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Post;
  }

  @override
  void update(void updates(PostBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Post build() {
    _$Post _$result;
    try {
      _$result = _$v ??
          new _$Post._(
              dateGmt: dateGmt,
              guid: _guid?.build(),
              id: id,
              link: link,
              modified: modified,
              modifiedGmt: modifiedGmt,
              slug: slug,
              status: status,
              type: type,
              password: password,
              title: _title?.build(),
              content: _content?.build(),
              author: author,
              excerpt: _excerpt?.build(),
              featuredMedia: featuredMedia,
              commentStatus: commentStatus,
              pingStatus: pingStatus,
              format: format,
              meta: meta,
              sticky: sticky,
              template: template,
              categories: _categories?.build(),
              tags: _tags?.build(),
              date: _date?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'guid';
        _guid?.build();

        _$failedField = 'title';
        _title?.build();
        _$failedField = 'content';
        _content?.build();

        _$failedField = 'excerpt';
        _excerpt?.build();

        _$failedField = 'categories';
        _categories?.build();
        _$failedField = 'tags';
        _tags?.build();
        _$failedField = 'date';
        _date?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Post', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PostGuid extends PostGuid {
  @override
  final String raw;
  @override
  final String rendered;

  factory _$PostGuid([void updates(PostGuidBuilder b)]) =>
      (new PostGuidBuilder()..update(updates)).build();

  _$PostGuid._({this.raw, this.rendered}) : super._();

  @override
  PostGuid rebuild(void updates(PostGuidBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PostGuidBuilder toBuilder() => new PostGuidBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostGuid && raw == other.raw && rendered == other.rendered;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, raw.hashCode), rendered.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostGuid')
          ..add('raw', raw)
          ..add('rendered', rendered))
        .toString();
  }
}

class PostGuidBuilder implements Builder<PostGuid, PostGuidBuilder> {
  _$PostGuid _$v;

  String _raw;
  String get raw => _$this._raw;
  set raw(String raw) => _$this._raw = raw;

  String _rendered;
  String get rendered => _$this._rendered;
  set rendered(String rendered) => _$this._rendered = rendered;

  PostGuidBuilder();

  PostGuidBuilder get _$this {
    if (_$v != null) {
      _raw = _$v.raw;
      _rendered = _$v.rendered;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostGuid other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostGuid;
  }

  @override
  void update(void updates(PostGuidBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PostGuid build() {
    final _$result = _$v ?? new _$PostGuid._(raw: raw, rendered: rendered);
    replace(_$result);
    return _$result;
  }
}

class _$PostTitle extends PostTitle {
  @override
  final String raw;
  @override
  final String rendered;

  factory _$PostTitle([void updates(PostTitleBuilder b)]) =>
      (new PostTitleBuilder()..update(updates)).build();

  _$PostTitle._({this.raw, this.rendered}) : super._();

  @override
  PostTitle rebuild(void updates(PostTitleBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PostTitleBuilder toBuilder() => new PostTitleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostTitle && raw == other.raw && rendered == other.rendered;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, raw.hashCode), rendered.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostTitle')
          ..add('raw', raw)
          ..add('rendered', rendered))
        .toString();
  }
}

class PostTitleBuilder implements Builder<PostTitle, PostTitleBuilder> {
  _$PostTitle _$v;

  String _raw;
  String get raw => _$this._raw;
  set raw(String raw) => _$this._raw = raw;

  String _rendered;
  String get rendered => _$this._rendered;
  set rendered(String rendered) => _$this._rendered = rendered;

  PostTitleBuilder();

  PostTitleBuilder get _$this {
    if (_$v != null) {
      _raw = _$v.raw;
      _rendered = _$v.rendered;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostTitle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostTitle;
  }

  @override
  void update(void updates(PostTitleBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PostTitle build() {
    final _$result = _$v ?? new _$PostTitle._(raw: raw, rendered: rendered);
    replace(_$result);
    return _$result;
  }
}

class _$PostContent extends PostContent {
  @override
  final String raw;
  @override
  final String rendered;
  @override
  final bool protected;

  factory _$PostContent([void updates(PostContentBuilder b)]) =>
      (new PostContentBuilder()..update(updates)).build();

  _$PostContent._({this.raw, this.rendered, this.protected}) : super._();

  @override
  PostContent rebuild(void updates(PostContentBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PostContentBuilder toBuilder() => new PostContentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostContent &&
        raw == other.raw &&
        rendered == other.rendered &&
        protected == other.protected;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, raw.hashCode), rendered.hashCode), protected.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostContent')
          ..add('raw', raw)
          ..add('rendered', rendered)
          ..add('protected', protected))
        .toString();
  }
}

class PostContentBuilder implements Builder<PostContent, PostContentBuilder> {
  _$PostContent _$v;

  String _raw;
  String get raw => _$this._raw;
  set raw(String raw) => _$this._raw = raw;

  String _rendered;
  String get rendered => _$this._rendered;
  set rendered(String rendered) => _$this._rendered = rendered;

  bool _protected;
  bool get protected => _$this._protected;
  set protected(bool protected) => _$this._protected = protected;

  PostContentBuilder();

  PostContentBuilder get _$this {
    if (_$v != null) {
      _raw = _$v.raw;
      _rendered = _$v.rendered;
      _protected = _$v.protected;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostContent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostContent;
  }

  @override
  void update(void updates(PostContentBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PostContent build() {
    final _$result = _$v ??
        new _$PostContent._(raw: raw, rendered: rendered, protected: protected);
    replace(_$result);
    return _$result;
  }
}

class _$PostExcerpt extends PostExcerpt {
  @override
  final String raw;
  @override
  final String rendered;
  @override
  final bool protected;

  factory _$PostExcerpt([void updates(PostExcerptBuilder b)]) =>
      (new PostExcerptBuilder()..update(updates)).build();

  _$PostExcerpt._({this.raw, this.rendered, this.protected}) : super._();

  @override
  PostExcerpt rebuild(void updates(PostExcerptBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PostExcerptBuilder toBuilder() => new PostExcerptBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostExcerpt &&
        raw == other.raw &&
        rendered == other.rendered &&
        protected == other.protected;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, raw.hashCode), rendered.hashCode), protected.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostExcerpt')
          ..add('raw', raw)
          ..add('rendered', rendered)
          ..add('protected', protected))
        .toString();
  }
}

class PostExcerptBuilder implements Builder<PostExcerpt, PostExcerptBuilder> {
  _$PostExcerpt _$v;

  String _raw;
  String get raw => _$this._raw;
  set raw(String raw) => _$this._raw = raw;

  String _rendered;
  String get rendered => _$this._rendered;
  set rendered(String rendered) => _$this._rendered = rendered;

  bool _protected;
  bool get protected => _$this._protected;
  set protected(bool protected) => _$this._protected = protected;

  PostExcerptBuilder();

  PostExcerptBuilder get _$this {
    if (_$v != null) {
      _raw = _$v.raw;
      _rendered = _$v.rendered;
      _protected = _$v.protected;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostExcerpt other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostExcerpt;
  }

  @override
  void update(void updates(PostExcerptBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PostExcerpt build() {
    final _$result = _$v ??
        new _$PostExcerpt._(raw: raw, rendered: rendered, protected: protected);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
