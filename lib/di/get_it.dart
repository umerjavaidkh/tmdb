import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb/data/core/abstract_client.dart';
import 'package:tmdb/presentation/blocs/movie_detail/movie_detail_cubit.dart';
import 'package:tmdb/presentation/blocs/popular_movies/popular_movie_cubit.dart';
import '../domain/usecases/get_preferred_theme_usecase.dart';
import '../domain/usecases/update_theme_usecase.dart';
import '../presentation/blocs/theme/theme_cubit.dart';
import '../data/data_sources/language_local_data_source.dart';
import '../data/data_sources/movie_remote_data_source.dart';
import '../data/repositories/app_repository_impl.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/app_repository.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_movie_detail_usecase.dart';
import '../domain/usecases/get_popular_usecase.dart';
import '../domain/usecases/get_preferred_language_usecase.dart';
import '../domain/usecases/search_movies_usecase.dart';
import '../domain/usecases/update_language_usecase.dart';
import '../presentation/blocs/language/language_cubit.dart';
import '../presentation/blocs/loading/loading_cubit.dart';
import '../presentation/blocs/search_movie/search_movie_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {


  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance
      .registerLazySingleton<RestClient>(() => RestClient.singleton(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredTheme>(
      () => GetPreferredTheme(getItInstance()));

  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
            getItInstance(),
          ));

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
        getItInstance(),
      ));

  getItInstance.registerFactory(
    () => SearchMovieCubit(
      loadingCubit: getItInstance(),
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => PopularMovieCubit(
      getPopular: getItInstance(),
      loadingCubit: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieDetailCubit(
      loadingCubit: getItInstance(),
      getMovieDetail: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageCubit>(LanguageCubit(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));
}
