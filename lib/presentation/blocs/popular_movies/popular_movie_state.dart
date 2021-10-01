part of 'popular_movie_cubit.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  final List<MovieEntity> movies;

  PopularMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieError extends PopularMovieState {
  final AppErrorType errorType;

  PopularMovieError(this.errorType);

  @override
  List<Object> get props => [errorType];
}
