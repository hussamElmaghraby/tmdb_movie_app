// To parse this JSON data, do
//
//     final movieResponseModel = movieResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';

part 'movies_response_model.freezed.dart';

part 'movies_response_model.g.dart';

MoviesResponseModel movieResponseModelFromJson(String str) =>
    MoviesResponseModel.fromJson(json.decode(str));

String movieResponseModelToJson(MoviesResponseModel data) =>
    json.encode(data.toJson());
@freezed
class MoviesResponseModel with _$MoviesResponseModel {
  const  MoviesResponseModel._();

  const factory MoviesResponseModel({
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "results") List<Result>? results,
    @JsonKey(name: "total_pages") int? totalPages,
    @JsonKey(name: "total_results") int? totalResults,
  }) = _MovieResponseModel;

  MoviesResponseEntity toEntity() => MoviesResponseEntity(
        page: page,
        results: results?.map((e) => e.toEntity()).toList() ?? [],
        totalPages: totalPages,
      );

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseModelFromJson(json);
}

@freezed
class Result with _$Result {
  const Result._();
  const factory Result({
    @JsonKey(name: "adult") bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "genre_ids") List<int>? genreIds,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    @JsonKey(name: "overview") String? overview,
    @JsonKey(name: "popularity") double? popularity,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "video") bool? video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _Result;

  ResultsEntity toEntity() => ResultsEntity(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
