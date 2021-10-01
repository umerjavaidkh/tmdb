import 'package:dio/dio.dart';
import 'package:tmdb/data/core/abstract_client.dart';
import 'package:tmdb/data/core/api_constants.dart';

import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';



abstract class MovieRemoteDataSource {

  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);

}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {

  final RestClient outClient;

  MovieRemoteDataSourceImpl(this.outClient);

  @override
  Future<List<MovieModel>> getPopular() async {
    final response  = await outClient.getPopularMovies();
    return response.results;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final movie  = await outClient.getMovieDetails(id);
    if (_isValidMovieDetail(movie)) {
      return movie;
    }
    throw Exception();
  }


  bool _isValidMovieDetail(MovieDetailModel movie) {
    return movie.id != -1 &&
        movie.title.isNotEmpty &&
        movie.posterPath.isNotEmpty;
  }


  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final response  = await outClient.searchMovies(searchTerm);
    return response.results;
  }

}
