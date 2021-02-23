// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PagingObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingObject<T> _$PagingObjectFromJson<T>(Map<String, dynamic> json) {
  return PagingObject<T>(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    href: json['href'] as String,
    items: PagingObject._itemsFromJson(json['items']),
    limit: json['limit'] as int,
    next: json['next'] as String,
    offset: json['offset'] as int,
    previous: json['previous'] as String,
    total: json['total'] as int,
  );
}
