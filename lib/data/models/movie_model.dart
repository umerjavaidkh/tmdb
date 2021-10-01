import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie_entity.dart';


part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends MovieEntity {
  final int id;
  final bool? video;
  final int? vote_count;
  final double? vote_average;
  final String title;
  final String? release_date;
  final String? original_language;
  final String? original_title;
  final List<int>? genre_ids;
  final String backdrop_path;
  final bool? adult;
  final String? overview;
  final String poster_path;
  final double? popularity;
  final String? mediaType;

  MovieModel({
    required this.id,
    this.video,
    this.vote_count,
    this.vote_average,
    required this.title,
    this.release_date,
    this.original_language,
    this.original_title,
    this.genre_ids,
    required this.backdrop_path,
    this.adult,
    this.overview,
    required this.poster_path,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdrop_path,
          posterPath: poster_path,
          releaseDate: release_date,
          voteAverage: vote_average,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieModelToJson(this);
  }
}
