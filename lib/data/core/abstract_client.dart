




import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:tmdb/data/models/movie_detail_model.dart';
import 'package:tmdb/data/models/movie_model.dart';
import 'package:tmdb/data/models/movies_result_model.dart';

import 'api_constants.dart';

part 'abstract_client.g.dart';

class Apis {
  static const String popularMovies = 'movie/popular';
  static const String moviesDetails = 'movie/{id}';
  static const String searchMovies = 'search/movie';
}


@RestApi(baseUrl:"https://api.themoviedb.org/3/")
abstract class RestClient {


  @GET(Apis.popularMovies)
  Future<MoviesResultModel> getPopularMovies();

  @GET(Apis.moviesDetails)
  Future<MovieDetailModel?>? getMovieDetails(@Path("id") int postId);

  @GET(Apis.searchMovies)
  Future<MoviesResultModel> searchMovies(@Query("query") String searchTerm);


  static singleton(Dio dio){
    dio.options = BaseOptions(queryParameters: {"api_key": ApiConstants.API_KEY});
    return _RestClient(dio, baseUrl:"https://api.themoviedb.org/3/");
  }
}