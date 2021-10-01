import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/entities/no_params.dart';
import 'package:tmdb/domain/usecases/get_popular.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_entity.dart';
import '../loading/loading_cubit.dart';

part 'popular_movie_state.dart';


class PopularMovieCubit extends Cubit<PopularMovieState> {
  final LoadingCubit loadingCubit;
  final GetPopular getPopular;
  PopularMovieCubit({
    required this.loadingCubit,
    required this.getPopular,
  }) : super(PopularMovieInitial());



  Future<void> loadPopularMovies() async {
    loadingCubit.show();
    emit(PopularMovieLoading());
    final Either<AppError, List<MovieEntity>> response =
    await getPopular(NoParams());
    emit(response.fold(
            (l) => PopularMovieError(l.appErrorType),
            (r) => PopularMovieLoaded(r),
      ));
    loadingCubit.hide();
  }
}
