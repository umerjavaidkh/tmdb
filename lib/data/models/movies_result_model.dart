import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'movies_result_model.g.dart';

@JsonSerializable()
class MoviesResultModel {
  late final int page;

  late final List<MovieModel> results;
  late final int total_pages;
  late final int total_results;
  MoviesResultModel({required this.results,required this.page,required this.total_pages,required this.total_results});

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    return _$MoviesResultModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
   return _$MoviesResultModelToJson(this);
  }
}

bool _isValidMovie(MovieModel movieModel) {
  return movieModel.id != -1 &&
      movieModel.title.isNotEmpty &&
      movieModel.backdropPath.isNotEmpty &&
      movieModel.posterPath.isNotEmpty;
}
