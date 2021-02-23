// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchObject _$SearchObjectFromJson(Map<String, dynamic> json) {
  return SearchObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    artists: json['artists'] == null
        ? null
        : PagingObject.fromJson(json['artists'] as Map<String, dynamic>),
    albums: json['albums'] == null
        ? null
        : PagingObject.fromJson(json['albums'] as Map<String, dynamic>),
    playlists: json['playlists'] == null
        ? null
        : PagingObject.fromJson(json['playlists'] as Map<String, dynamic>),
    tracks: json['tracks'] == null
        ? null
        : PagingObject.fromJson(json['tracks'] as Map<String, dynamic>),
  );
}
