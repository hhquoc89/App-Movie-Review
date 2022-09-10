import 'package:flutter_boilerplate/api/api_client.dart';
import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';
import 'package:flutter_boilerplate/api/decodable.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

class TvDetailRepositories {
  APIClient apiClient = APIClient();
  Future<TvDetailModel?> getTVDetail(num tvId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.tvDetail),
          extraPath: '$tvId?api_key=$apiKey&append_to_response=credits',
          create: (response) => APIResponse<TvDetailModel?>(
              createObject: TvDetailModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<MoviesResultModel?> getRecommendationTv(num movieId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.tvDetail),
          extraPath: '$movieId/recommendations?api_key=$apiKey',
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<KeywordsTV?> getKeywordsTv(num tvId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.tvDetail),
          extraPath: '$tvId/keywords?api_key=$apiKey',
          create: (response) => APIResponse<KeywordsTV?>(
              createObject: KeywordsTV(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Trailers?> getTrailersTv(num tvId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.tvDetail),
          extraPath: '$tvId/videos?api_key=$apiKey',
          create: (response) => APIResponse<Trailers?>(
              createObject: Trailers(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

class TvDetailModel extends Decoder<TvDetailModel> {
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<Genres>? genres;
  String? homepage;
  num? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  NextEpisodeToAir? nextEpisodeToAir;
  List<Networks>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<Seasons>? seasons;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;
  Credits? credits;

  TvDetailModel(
      {this.adult,
      this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount,
      this.credits});
  @override
  TvDetailModel decode(Map<String, dynamic> json) {
    return TvDetailModel.fromJson(json);
  }

  TvDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = <CreatedBy>[];
      json['created_by'].forEach((v) {
        createdBy!.add(new CreatedBy.fromJson(v));
      });
    }
    episodeRunTime = json['episode_run_time'].cast<int>();
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages = json['languages'].cast<String>();
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'] != null
        ? new NextEpisodeToAir.fromJson(json['next_episode_to_air'])
        : null;
    if (json['networks'] != null) {
      networks = <Networks>[];
      json['networks'].forEach((v) {
        networks!.add(new Networks.fromJson(v));
      });
    }
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(new ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(new Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    credits =
        json['credits'] != null ? new Credits.fromJson(json['credits']) : null;
  }
}

class CreatedBy extends Decoder<CreatedBy> {
  num? id;
  String? creditId;
  String? name;
  int? gender;
  String? profilePath;

  CreatedBy({this.id, this.creditId, this.name, this.gender, this.profilePath});

  @override
  CreatedBy decode(Map<String, dynamic> json) {
    return CreatedBy.fromJson(json);
  }

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    gender = json['gender'];
    profilePath = json['profile_path'];
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

class LastEpisodeToAir extends Decoder<LastEpisodeToAir> {
  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  LastEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.runtime,
      this.seasonNumber,
      this.showId,
      this.stillPath,
      this.voteAverage,
      this.voteCount});

  @override
  LastEpisodeToAir decode(Map<String, dynamic> json) {
    return LastEpisodeToAir.fromJson(json);
  }

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}

class NextEpisodeToAir extends Decoder<NextEpisodeToAir> {
  String? airDate;
  int? episodeNumber;
  num? id;
  String? name;
  String? overview;
  String? productionCode;
  num? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  NextEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.runtime,
      this.seasonNumber,
      this.showId,
      this.stillPath,
      this.voteAverage,
      this.voteCount});

  @override
  NextEpisodeToAir decode(Map<String, dynamic> json) {
    return NextEpisodeToAir.fromJson(json);
  }

  NextEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}

class Networks extends Decoder<Networks> {
  int? id;
  String? name;
  String? logoPath;
  String? originCountry;

  Networks({this.id, this.name, this.logoPath, this.originCountry});

  @override
  Networks decode(Map<String, dynamic> json) {
    return Networks.fromJson(json);
  }

  Networks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
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

class Seasons extends Decoder<Seasons> {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  Seasons(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber});

  @override
  Seasons decode(Map<String, dynamic> json) {
    return Seasons.fromJson(json);
  }

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
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

class KeywordsTV extends Decoder<KeywordsTV> {
  int? id;
  List<ResultsKeywords>? results;

  KeywordsTV({this.id, this.results});

  @override
  KeywordsTV decode(Map<String, dynamic> json) {
    return KeywordsTV.fromJson(json);
  }

  KeywordsTV.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <ResultsKeywords>[];
      json['results'].forEach((v) {
        results!.add(ResultsKeywords.fromJson(v));
      });
    }
  }
}

class ResultsKeywords extends Decoder<ResultsKeywords> {
  String? name;
  int? id;

  ResultsKeywords({this.name, this.id});

  @override
  ResultsKeywords decode(Map<String, dynamic> json) {
    return ResultsKeywords.fromJson(json);
  }

  ResultsKeywords.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}
