// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EpisodeObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimplifiedEpisodeObject _$SimplifiedEpisodeObjectFromJson(
    Map<String, dynamic> json) {
  return SimplifiedEpisodeObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    audioPreviewURL: json['audio_preview_url'] as String,
    description: json['description'] as String,
    durationMS: json['duration_ms'] as int,
    explicit: json['explicit'] as bool,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isExternallyHosted: json['is_externally_hosted'] as bool,
    isPlayable: json['is_playable'] as bool,
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    releaseDate: json['release_date'] as String,
    releaseDatePrecision: json['release_date_precision'] as String,
    resumePoint: json['resume_point'] == null
        ? null
        : ResumePoint.fromJson(json['resume_point'] as Map<String, dynamic>),
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

EpisodeObject _$EpisodeObjectFromJson(Map<String, dynamic> json) {
  return EpisodeObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    audioPreviewURL: json['audio_preview_url'] as String,
    description: json['description'] as String,
    durationMS: json['duration_ms'] as int,
    explicit: json['explicit'] as bool,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isExternallyHosted: json['is_externally_hosted'] as bool,
    isPlayable: json['is_playable'] as bool,
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    releaseDate: json['release_date'] as String,
    releaseDatePrecision: json['release_date_precision'] as String,
    resumePoint: json['resume_point'] == null
        ? null
        : ResumePoint.fromJson(json['resume_point'] as Map<String, dynamic>),
    type: json['type'] as String,
    uri: json['uri'] as String,
    show: json['show'] == null
        ? null
        : SimplifiedShowObject.fromJson(json['show'] as Map<String, dynamic>),
  );
}

ResumePoint _$ResumePointFromJson(Map<String, dynamic> json) {
  return ResumePoint(
    fullyPlayed: json['fully_played'] as bool,
    resumePositionMS: json['resume_position_ms'] as int,
  );
}
