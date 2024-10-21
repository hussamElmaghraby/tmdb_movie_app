// To parse this JSON data, do
//
//     final movieDetailsResponseModel = movieDetailsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';

part 'movie_details_response_model.freezed.dart';

part 'movie_details_response_model.g.dart';

MovieDetailsResponseModel movieDetailsResponseModelFromJson(String str) =>
    MovieDetailsResponseModel.fromJson(json.decode(str));

String movieDetailsResponseModelToJson(MovieDetailsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class MovieDetailsResponseModel with _$MovieDetailsResponseModel {
  const MovieDetailsResponseModel._();

  const factory MovieDetailsResponseModel({
    @JsonKey(name: "adult") bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "belongs_to_collection")
    BelongsToCollection? belongsToCollection,
    @JsonKey(name: "budget") int? budget,
    @JsonKey(name: "genres") List<Genre>? genres,
    @JsonKey(name: "homepage") String? homepage,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "imdb_id") String? imdbId,
    @JsonKey(name: "origin_country") List<String>? originCountry,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    @JsonKey(name: "overview") String? overview,
    @JsonKey(name: "popularity") double? popularity,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "production_companies")
    List<ProductionCompany>? productionCompanies,
    @JsonKey(name: "production_countries")
    List<ProductionCountry>? productionCountries,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    @JsonKey(name: "revenue") int? revenue,
    @JsonKey(name: "runtime") int? runtime,
    @JsonKey(name: "spoken_languages") List<SpokenLanguage>? spokenLanguages,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "tagline") String? tagline,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "video") bool? video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _MovieDetailsResponseModel;

  MovieDetailsResponseEntity toEntity() => MovieDetailsResponseEntity(
        adult: adult,
        backdropPath: backdropPath,
        belongsToCollection: belongsToCollection?.toEntity(),
        budget: budget,
        genres: genres?.map((e) => e.toEntity()).toList(),
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        productionCompanies:
            productionCompanies?.map((e) => e.toEntity()).toList(),
        productionCountries:
            productionCountries?.map((e) => e.toEntity()).toList(),
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages?.map((e) => e.toEntity()).toList(),
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: voteAverage,
      );

  factory MovieDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseModelFromJson(json);
}

@freezed
class BelongsToCollection with _$BelongsToCollection {
  const BelongsToCollection._();

  const factory BelongsToCollection({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "poster_path") dynamic posterPath,
    @JsonKey(name: "backdrop_path") dynamic backdropPath,
  }) = _BelongsToCollection;

  BelongsToCollectionEntity toEntity() => BelongsToCollectionEntity(
        id: id,
        name: name,
        posterPath: posterPath,
        backdropPath: backdropPath,
      );

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@freezed
class Genre with _$Genre {
  const Genre._();

  const factory Genre({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
  }) = _Genre;

  GenreEntity toEntity() => GenreEntity(
        id: id,
        name: name,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const ProductionCompany._();

  const factory ProductionCompany({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "logo_path") String? logoPath,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "origin_country") String? originCountry,
  }) = _ProductionCompany;

  ProductionCompanyEntity toEntity() => ProductionCompanyEntity(
        id: id,
        logoPath: logoPath,
        name: name,
        originCountry: originCountry,
      );

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  const ProductionCountry._();

  const factory ProductionCountry({
    @JsonKey(name: "iso_3166_1") String? iso31661,
    @JsonKey(name: "name") String? name,
  }) = _ProductionCountry;

  ProductionCountryEntity toEntity() =>
      ProductionCountryEntity(iso31661: iso31661, name: name);

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const SpokenLanguage._();

  const factory SpokenLanguage({
    @JsonKey(name: "english_name") String? englishName,
    @JsonKey(name: "iso_639_1") String? iso6391,
    @JsonKey(name: "name") String? name,
  }) = _SpokenLanguage;

  SpokenLanguageEntity toEntity() => SpokenLanguageEntity(
      iso6391: iso6391, name: name, englishName: englishName);

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
