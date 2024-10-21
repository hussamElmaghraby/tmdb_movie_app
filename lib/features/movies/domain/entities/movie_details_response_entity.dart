class MovieDetailsResponseEntity {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollectionEntity? belongsToCollection;
  final int? budget;
  final List<GenreEntity>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity>? productionCompanies;
  final List<ProductionCountryEntity>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageEntity>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;

  MovieDetailsResponseEntity(
      {required this.adult,
      required this.backdropPath,
      required this.belongsToCollection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.spokenLanguages,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage});
}

class ProductionCompanyEntity {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanyEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
}

class ProductionCountryEntity {

  final String? iso31661;

  final String? name;

  ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });
}

class SpokenLanguageEntity {
  final String? iso6391;
  final String? name;
  final String? englishName;

  SpokenLanguageEntity(
      {required this.iso6391, required this.name, required this.englishName});
}

class GenreEntity {
  final int? id;
  final String? name;

  GenreEntity({
    required this.id,
    required this.name,
  });
}

class BelongsToCollectionEntity {
  final int? id;
  final String? name;
  final dynamic posterPath;
  final dynamic backdropPath;

  BelongsToCollectionEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });
}
