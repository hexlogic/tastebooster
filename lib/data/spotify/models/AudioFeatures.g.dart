// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AudioFeatures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioFeatures _$AudioFeaturesFromJson(Map<String, dynamic> json) {
  return AudioFeatures(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    acousticness: (json['acousticness'] as num)?.toDouble(),
    analysisURL: json['analysis_url'] as String,
    danceability: (json['danceability'] as num)?.toDouble(),
    durationMS: json['duration_ms'] as int,
    energy: (json['energy'] as num)?.toDouble(),
    id: json['id'] as String,
    instrumentalness: (json['instrumentalness'] as num)?.toDouble(),
    key: json['key'] as int,
    liveness: (json['liveness'] as num)?.toDouble(),
    loudness: (json['loudness'] as num)?.toDouble(),
    mode: json['mode'] as int,
    speechiness: (json['speechiness'] as num)?.toDouble(),
    tempo: (json['tempo'] as num)?.toDouble(),
    timeSignature: json['time_signarure'] as int,
    trackHref: json['track_href'] as String,
    type: json['type'] as String,
    uri: json['uri'] as String,
    valence: (json['valence'] as num)?.toDouble(),
  );
}
