import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb/data/core/abstract_client.dart';
import 'package:tmdb/data/data_sources/movie_remote_data_source.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/data/models/movie_detail_model.dart';

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements RestClient {}



void main() {


  MockHttpClient mockHttpClient =MockHttpClient();
  MovieRemoteDataSourceImpl dataSource =MovieRemoteDataSourceImpl(mockHttpClient);

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


  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.getMovieDetails(637534))
        .thenAnswer((_) async => movieDetailsModel);
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.getMovieDetails(637534))
        .thenAnswer((_) async => throw Exception());
  }


  group('getMovieDetail', () {
    final id = 637534;
    final movieDetailsModel =
    MovieDetailModel.fromJson(json.decode(fixture('movie_detail_model.json')));

    test(
      '''should perform a GET request on a URL with number
       being the endpoint and with application/json header''',
          () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getMovieDetail(id);
        // assert
        verify(mockHttpClient.getMovieDetails(id));
      },
    );

    test(
      'should return MovieDetailModel when the response code is 200 (success)',
          () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getMovieDetail(id);
        // assert
        expect(result, equals(movieDetailsModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getMovieDetail(id);
        // assert
        expect(() => call, throwsA(TypeMatcher<Exception>()));
      },
    );
  });


}