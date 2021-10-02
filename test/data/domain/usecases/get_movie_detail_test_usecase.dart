import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:tmdb/data/models/movie_detail_model.dart';
import 'package:tmdb/domain/entities/movie_params.dart';
import 'package:tmdb/domain/repositories/movie_repository.dart';
import 'package:tmdb/domain/usecases/get_movie_detail_usecase.dart';

class MockGetMovieDetailRepository extends Mock
    implements MovieRepository {
}


void main() {

 late final GetMovieDetail usecase;
 late final MockGetMovieDetailRepository mockGetMovieDetailRepository;

  setUp(() {
    mockGetMovieDetailRepository = MockGetMovieDetailRepository();
    usecase = GetMovieDetail(mockGetMovieDetailRepository);
  });


  final movieId = 637534;
  final movieDetailsModel = MovieDetailModel(
      id: 637534,
      imdbId:"tt10404944",
      originalLanguage:"fr",
      originalTitle:"BAC Nord",
      overview:"A police brigade working in the dangerous northern neighborhoods of Marseille, where the level of crime is higher than anywhere else in France.",
      popularity:3775.194,
      posterPath:"/nLanxl7Xhfbd5s8FxPy8jWZw4rv.jpg",
      releaseDate:"2021-08-18",
      revenue:0,
      runtime:105,
      status:"Released",
      tagline:"",
      title:"The Stronghold",
      video:false,
      voteAverage:7.8,
      voteCount:335,
      backdropPath:"",
      budget: null,
      homepage: null
  );


  test(
    'should get movie detail  from the repository',
        () async {
      // arrange
      when(mockGetMovieDetailRepository.getMovieDetail(movieId))
          .thenAnswer((_) async => Right(movieDetailsModel));
      // act
      final result = await usecase(MovieParams(movieId));
      // assert
      expect(result, Right(movieDetailsModel));
      verify(mockGetMovieDetailRepository.getMovieDetail(movieId));
      verifyNoMoreInteractions(mockGetMovieDetailRepository);
    },
  );

}