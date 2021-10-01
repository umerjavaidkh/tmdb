// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResultModel _$MoviesResultModelFromJson(Map<String, dynamic> json) {
  return MoviesResultModel(
    results: (json['results'] as List<dynamic>)
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    page: json['page'] as int,
    total_pages: json['total_pages'] as int,
    total_results: json['total_results'] as int,
  );
}

Map<String, dynamic> _$MoviesResultModelToJson(MoviesResultModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
