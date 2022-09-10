import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/api/api_client.dart';
import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';
import 'package:flutter_boilerplate/api/decodable.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

class MovieDetailRepositories {
  APIClient apiClient = APIClient();
  Future<MovieDetailModel?> getMovieDetail(num movieId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.movieDetail),
          extraPath: '$movieId?api_key=$apiKey&append_to_response=credits',
          create: (response) => APIResponse<MovieDetailModel?>(
              createObject: MovieDetailModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<MoviesResultModel?> getRecommendation(num movieId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.movieDetail),
          extraPath: '$movieId/recommendations?api_key=$apiKey',
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<KeywordsModel?> getKeywordsMovie(num movieId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.keywordsMovie),
          extraPath: '$movieId/keywords?api_key=$apiKey',
          create: (response) => APIResponse<KeywordsModel?>(
              createObject: KeywordsModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Trailers?> getTrailersMovie(num movieId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.movieDetail),
          extraPath: '$movieId/videos?api_key=$apiKey',
          create: (response) => APIResponse<Trailers?>(
              createObject: Trailers(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

class MovieDetailModel extends Decoder<MovieDetailModel> {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Credits? credits;

  MovieDetailModel(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.credits});
  @override
  MovieDetailModel decode(Map<String, dynamic> json) {
    return MovieDetailModel.fromJson(json);
  }

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    credits =
        json['credits'] != null ?  Credits.fromJson(json['credits']) : null;
  }
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  @override
  BelongsToCollection decode(Map<String, dynamic> json) {
    return BelongsToCollection.fromJson(json);
  }

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
}

class Genres extends Decoder<Genres> {
  int? id;
  String? name;

  Genres({this.id, this.name});

  @override
  Genres decode(Map<String, dynamic> json) {
    return Genres.fromJson(json);
  }

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ProductionCompanies extends Decoder<ProductionCompanies> {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  @override
  ProductionCompanies decode(Map<String, dynamic> json) {
    return ProductionCompanies.fromJson(json);
  }

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
}

class ProductionCountries extends Decoder<ProductionCountries> {
  String? iso3166_1;
  String? name;

  ProductionCountries({this.iso3166_1, this.name});

  @override
  ProductionCountries decode(Map<String, dynamic> json) {
    return ProductionCountries.fromJson(json);
  }

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso3166_1 = json['iso_3166_1'];
    name = json['name'];
  }
}

class SpokenLanguages extends Decoder<SpokenLanguages> {
  String? englishName;
  String? iso639_1;
  String? name;

  SpokenLanguages({this.englishName, this.iso639_1, this.name});
  @override
  SpokenLanguages decode(Map<String, dynamic> json) {
    return SpokenLanguages.fromJson(json);
  }

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso639_1 = json['iso_639_1'];
    name = json['name'];
  }
}

class Credits extends Decoder<Credits> {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({this.cast, this.crew});
  @override
  Credits decode(Map<String, dynamic> json) {
    return Credits.fromJson(json);
  }

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(new Crew.fromJson(v));
      });
    }
  }
}

class Cast extends Decoder<Cast> {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});
  @override
  Cast decode(Map<String, dynamic> json) {
    return Cast.fromJson(json);
  }

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }
}

class Crew extends Decoder<Crew> {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});
  @override
  Crew decode(Map<String, dynamic> json) {
    return Crew.fromJson(json);
  }

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }
}

class KeywordsModel extends Decoder<KeywordsModel> {
  int? id;
  List<Keywords>? keywords;

  KeywordsModel({this.id, this.keywords});

  @override
  KeywordsModel decode(Map<String, dynamic> json) {
    return KeywordsModel.fromJson(json);
  }

  KeywordsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['keywords'] != null) {
      keywords = <Keywords>[];
      json['keywords'].forEach((v) {
        keywords!.add(Keywords.fromJson(v));
      });
    }
  }
}

class Keywords extends Decoder<Keywords> {
  int? id;
  String? name;

  Keywords({this.id, this.name});

  @override
  Keywords decode(Map<String, dynamic> json) {
    return Keywords.fromJson(json);
  }

  Keywords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Trailers extends Decoder<Trailers> {
  int? id;
  List<ResultsTrailer>? results;

  Trailers({this.id, this.results});

  @override
  Trailers decode(Map<String, dynamic> json) {
    return Trailers.fromJson(json);
  }

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <ResultsTrailer>[];
      json['results'].forEach((v) {
        results!.add(ResultsTrailer.fromJson(v));
      });
    }
  }
}

class ResultsTrailer extends Decoder<ResultsTrailer> {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  ResultsTrailer(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  @override
  ResultsTrailer decode(Map<String, dynamic> json) {
    return ResultsTrailer.fromJson(json);
  }

  ResultsTrailer.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
}
