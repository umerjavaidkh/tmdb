import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/common/constants/size_constants.dart';
import 'package:tmdb/common/constants/translation_constants.dart';
import 'package:tmdb/presentation/blocs/popular_movies/popular_movie_cubit.dart';
import 'package:tmdb/presentation/pages/drawer/navigation_drawer.dart';
import 'package:tmdb/presentation/pages/search_movie/search_movie_card.dart';
import 'package:tmdb/presentation/widgets/movie_app_bar.dart';
import '../../../di/get_it.dart';
import '../../blocs/search_movie/search_movie_cubit.dart';
import '../../widgets/app_error_widget.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/constants/translation_constants.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SearchMovieCubit searchMovieCubit;
  late PopularMovieCubit popularMovieCubit;

  @override
  void initState() {
    super.initState();
    searchMovieCubit = getItInstance<SearchMovieCubit>();
    popularMovieCubit = getItInstance<PopularMovieCubit>();
    popularMovieCubit.loadPopularMovies();
  }

  @override
  void dispose() {
    super.dispose();
    searchMovieCubit.close();
    popularMovieCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: searchMovieCubit,
        ),
        BlocProvider.value(
          value: popularMovieCubit,
        ),
      ],
      child: Scaffold(
          drawer: const NavigationDrawer(),
          body: Container(
            child: Column(
              children: [
                MovieAppBar(),
                Flexible(
                  child: BlocBuilder<PopularMovieCubit, PopularMovieState>(
                    bloc: popularMovieCubit,
                    builder: (context, state) {
                      if (state is PopularMovieError) {
                        return AppErrorWidget(
                          errorType: state.errorType,
                          onPressed: () => popularMovieCubit.loadPopularMovies(),
                        );
                      } else if (state is PopularMovieLoaded) {
                        final movies = state.movies;
                        if (movies.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.dimen_64.w),
                              child: Text(
                                TranslationConstants.noMoviesSearched
                                    .t(context),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemBuilder: (context, index) => ListMovieCard(
                            movie: movies[index],
                          ),
                          itemCount: movies.length,
                          scrollDirection: Axis.vertical,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
