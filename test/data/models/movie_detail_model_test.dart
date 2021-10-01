



import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb/data/models/movie_detail_model.dart';
import 'package:tmdb/domain/entities/movie_detail_entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final movieDetailsModel = MovieDetailModel(id: 637534,posterPath: "",title: "test movie");

  test(
    'should be a subclass of MovieDetailEntity entity',
        () async {
      // assert
      expect(movieDetailsModel, isA<MovieDetailEntity>());
    },
  );


  group('fromJson', ()
  {
    test(
      'should return a valid model when the JSON id is interger',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('movie_detail_model.json'));
        // act
        final result = MovieDetailModel.fromJson(jsonMap);
        // assert
        expect(result, movieDetailsModel);
      },
    );


    test(
      'should return a valid model when the JSON number is regarded as a double',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('movie_detail_model_double_id.json'));
        // act
        final result = MovieDetailModel.fromJson(jsonMap);
        // assert
        expect(result, movieDetailsModel);
      },
    );

  });//group end



  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        // act
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
         final result = movieDetailsModel.toJson();
        // assert
        final expectedMap = {
          "id":637534,
          "imdb_id":"tt10404944",
          "original_language":"fr",
          "original_title":"BAC Nord",
          "overview":"A police brigade working in the dangerous northern neighborhoods of Marseille, where the level of crime is higher than anywhere else in France.",
          "popularity":3775.194,
          "poster_path":"/nLanxl7Xhfbd5s8FxPy8jWZw4rv.jpg",
          "release_date":"2021-08-18",
          "revenue":0,
          "runtime":105,
          "status":"Released",
          "tagline":"",
          "title":"The Stronghold",
          "video":false,
          "vote_average":7.8,
          "vote_count":335,
          "adult":null,
          "backdrop_path":"",
          "budget": null,
          "homepage": null
        };

        expect(result, expectedMap);
      },
    );


  });


}


