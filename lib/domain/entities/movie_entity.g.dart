// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) {
  return MovieEntity(
    posterPath: json['posterPath'] as String,
    id: json['id'] as int,
    backdropPath: json['backdropPath'] as String,
    title: json['title'] as String,
    voteAverage: json['voteAverage'] as num?,
    releaseDate: json['releaseDate'] as String?,
    overview: json['overview'] as String?,
  );
}

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'posterPath': instance.posterPath,
      'id': instance.id,
      'backdropPath': instance.backdropPath,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'releaseDate': instance.releaseDate,
      'overview': instance.overview,
    };
