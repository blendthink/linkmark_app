// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Link _$LinkFromJson(Map<String, dynamic> json) {
  return _Link.fromJson(json);
}

/// @nodoc
class _$LinkTearOff {
  const _$LinkTearOff();

// ignore: unused_element
  _Link call(
      {@required String id,
      @required String url,
      String title = '',
      String description = '',
      String imageUrl,
      List<String> tagIds}) {
    return _Link(
      id: id,
      url: url,
      title: title,
      description: description,
      imageUrl: imageUrl,
      tagIds: tagIds,
    );
  }

// ignore: unused_element
  Link fromJson(Map<String, Object> json) {
    return Link.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Link = _$LinkTearOff();

/// @nodoc
mixin _$Link {
  String get id;
  String get url;
  String get title;
  String get description;
  String get imageUrl;
  List<String> get tagIds;

  Map<String, dynamic> toJson();
  $LinkCopyWith<Link> get copyWith;
}

/// @nodoc
abstract class $LinkCopyWith<$Res> {
  factory $LinkCopyWith(Link value, $Res Function(Link) then) =
      _$LinkCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String url,
      String title,
      String description,
      String imageUrl,
      List<String> tagIds});
}

/// @nodoc
class _$LinkCopyWithImpl<$Res> implements $LinkCopyWith<$Res> {
  _$LinkCopyWithImpl(this._value, this._then);

  final Link _value;
  // ignore: unused_field
  final $Res Function(Link) _then;

  @override
  $Res call({
    Object id = freezed,
    Object url = freezed,
    Object title = freezed,
    Object description = freezed,
    Object imageUrl = freezed,
    Object tagIds = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      url: url == freezed ? _value.url : url as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      tagIds: tagIds == freezed ? _value.tagIds : tagIds as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$LinkCopyWith<$Res> implements $LinkCopyWith<$Res> {
  factory _$LinkCopyWith(_Link value, $Res Function(_Link) then) =
      __$LinkCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String url,
      String title,
      String description,
      String imageUrl,
      List<String> tagIds});
}

/// @nodoc
class __$LinkCopyWithImpl<$Res> extends _$LinkCopyWithImpl<$Res>
    implements _$LinkCopyWith<$Res> {
  __$LinkCopyWithImpl(_Link _value, $Res Function(_Link) _then)
      : super(_value, (v) => _then(v as _Link));

  @override
  _Link get _value => super._value as _Link;

  @override
  $Res call({
    Object id = freezed,
    Object url = freezed,
    Object title = freezed,
    Object description = freezed,
    Object imageUrl = freezed,
    Object tagIds = freezed,
  }) {
    return _then(_Link(
      id: id == freezed ? _value.id : id as String,
      url: url == freezed ? _value.url : url as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      tagIds: tagIds == freezed ? _value.tagIds : tagIds as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Link implements _Link {
  _$_Link(
      {@required this.id,
      @required this.url,
      this.title = '',
      this.description = '',
      this.imageUrl,
      this.tagIds})
      : assert(id != null),
        assert(url != null),
        assert(title != null),
        assert(description != null);

  factory _$_Link.fromJson(Map<String, dynamic> json) =>
      _$_$_LinkFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final List<String> tagIds;

  @override
  String toString() {
    return 'Link(id: $id, url: $url, title: $title, description: $description, imageUrl: $imageUrl, tagIds: $tagIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Link &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.tagIds, tagIds) ||
                const DeepCollectionEquality().equals(other.tagIds, tagIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(tagIds);

  @override
  _$LinkCopyWith<_Link> get copyWith =>
      __$LinkCopyWithImpl<_Link>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LinkToJson(this);
  }
}

abstract class _Link implements Link {
  factory _Link(
      {@required String id,
      @required String url,
      String title,
      String description,
      String imageUrl,
      List<String> tagIds}) = _$_Link;

  factory _Link.fromJson(Map<String, dynamic> json) = _$_Link.fromJson;

  @override
  String get id;
  @override
  String get url;
  @override
  String get title;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  List<String> get tagIds;
  @override
  _$LinkCopyWith<_Link> get copyWith;
}