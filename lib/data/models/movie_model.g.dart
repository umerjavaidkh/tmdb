// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    id: json['id'] as int,
    video: json['video'] as bool?,
    vote_count: json['vote_count'] as int?,
    vote_average: (json['vote_average'] as num?)?.toDouble(),
    title: json['title'] as String,
    release_date: json['release_date'] as String?,
    original_language: json['original_language'] as String?,
    original_title: json['original_title'] as String?,
    genre_ids:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    backdrop_path: json['backdrop_path']==null ? "":json['backdrop_path'],
    adult: json['adult'] as bool?,
    overview: json['overview'] as String?,
    poster_path: json['poster_path'] as String,
    popularity: (json['popularity'] as num?)?.toDouble(),
    mediaType: json['mediaType'] as String?,
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'vote_count': instance.vote_count,
      'vote_average': instance.vote_average,
      'title': instance.title,
      'release_date': instance.release_date,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'genre_ids': instance.genre_ids,
      'backdrop_path': instance.backdrop_path,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'popularity': instance.popularity,
      'mediaType': instance.mediaType,
    };
