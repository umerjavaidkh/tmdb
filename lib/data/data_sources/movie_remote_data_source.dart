import '../core/api_client.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/movies_result_model.dart';


abstract class MovieRemoteDataSource {

  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);

}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);


  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }


  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
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
    final response = await _client.get('search/movie', params: {
      'query': searchTerm,
    });
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }
}
