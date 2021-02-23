// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicUserObject _$PublicUserObjectFromJson(Map<String, dynamic> json) {
  return PublicUserObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    displayName: json['display_name'] as String,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    followers: json['followers'] == null
        ? null
        : FollowersObject.fromJson(json['followers'] as Map<String, dynamic>),
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

PrivateUserObject _$PrivateUserObjectFromJson(Map<String, dynamic> json) {
  return PrivateUserObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    country: json['country'] as String,
    displayName: json['display_name'] as String,
    email: json['email'] as String,
    explicitContent: json['explicit_content'] == null
        ? null
        : ExplicitContentSettingsObject.fromJson(
            json['explicit_content'] as Map<String, dynamic>),
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    followers: json['followers'] == null
        ? null
        : FollowersObject.fromJson(json['followers'] as Map<String, dynamic>),
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    product: json['product'] as String,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}
