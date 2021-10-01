import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_entity.dart';


abstract class MovieRepository {

  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(
      String searchTerm);
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
}
