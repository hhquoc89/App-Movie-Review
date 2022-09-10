import 'package:flutter_boilerplate/api/api_client.dart';
import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';
import 'package:flutter_boilerplate/api/decodable.dart';

class SearchRepositories {
  APIClient apiClient = APIClient();
  Future<MoviesResultModel?> getListMovie(String query, num page) async {
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.search),
          extraPath: '&page=$page' '&query=$query',
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<MoviesResultModel?> getData(String query) async {
    try {
      final _response = await apiClient.request(
          route: APIRoute(APIType.search),
          extraPath: query,
          create: (_) => APIResponse<MoviesResultModel?>(
              response: _, createObject: MoviesResultModel()));
      return _response.decodedData!;
    } catch (e) {
      print('error');
    }
  }
}

class MoviesResultModel extends Decoder<MoviesResultModel> {
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;

  MoviesResultModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  @override
  MoviesResultModel decode(Map<String, dynamic> json) {
    return MoviesResultModel.fromJson(json);
  }

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
  @override
  String pageToString() {
    return '$page';
  }

  static getListMovie() {}
}

class Results extends Decoder<Results> {
  bool? adult;
  String? firstAirDate;
  String? backdropPath;
  List<int>? genreIds;
  List<String>? originCountry;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  String? mediaType;
  Results({
    this.originalName,
    this.originCountry,
    this.name,
    this.firstAirDate,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.mediaType,
  });
  @override
  Results decode(Map<String, dynamic> json) {
    return Results.fromJson(json);
  }

  @override
  Results.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    if (json['origin_country'] != null) {
      originCountry = json['origin_country'].cast<String>();
    }
    name = json['name'];
    firstAirDate = json['first_air_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genre_ids'] != null) {
      genreIds = json['genre_ids'].cast<int>();
    }
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    mediaType = json['media_type'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
