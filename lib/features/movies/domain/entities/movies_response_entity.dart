class MoviesResponseEntity {
  final int? page;
  final int? totalPages;
  final List<ResultsEntity> results;

  MoviesResponseEntity({
    required this.page,
    required this.totalPages,
    required this.results,
  });
}

class ResultsEntity {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;

  final String? overview;
  final double? popularity;

  final String? posterPath;
  final DateTime? releaseDate;

  final String? title;
  final bool? video;

  final double? voteAverage;
  final int? voteCount;

  ResultsEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}



