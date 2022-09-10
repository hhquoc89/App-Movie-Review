import 'package:dio/dio.dart';

import '../configs/constants.dart';

enum APIType {
  test,
  testPost,
  placementDetail,
  allOwners,
  getToken,
  validate,
  search,
  popularTV,
  popularTheater,
  movieDetail,
  recommendMovie,
  keywordsMovie,
  trailerMovie,
  tvDetail,
  personDetail,
  trendingDay,
  trendingWeek,
}

class APIRoute implements APIRouteConfigurable {
  final APIType type;

  ///you can override the base url here
  String? baseUrl;
  String? routeParams;
  String? method;

  APIRoute(this.type, {this.baseUrl, this.routeParams, this.method});

  /// Return config of api (method, url, header)
  @override
  RequestOptions? getConfig(BaseOptions baseOption) {
    bool authorize = true;
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    String method = APIMethod.get, path = "";
    ResponseType responseType = ResponseType.json;
    switch (type) {
      case APIType.trendingWeek:
        baseUrl =
            "https://api.themoviedb.org/3/trending/all/week?api_key=" + apiKey;
        authorize = false;
        break;
      case APIType.trendingDay:
        baseUrl =
            "https://api.themoviedb.org/3/trending/all/day?api_key=" + apiKey;
        authorize = false;
        break;
      case APIType.personDetail:
        baseUrl = "https://api.themoviedb.org/3/person/";
        authorize = false;
        break;
      case APIType.tvDetail:
        baseUrl = "https://api.themoviedb.org/3/tv/";
        authorize = false;
        break;
      case APIType.trailerMovie:
        baseUrl = "https://api.themoviedb.org/3/movie/";
        authorize = false;
        break;
      case APIType.keywordsMovie:
        baseUrl = "https://api.themoviedb.org/3/movie/";
        authorize = false;
        break;
      case APIType.recommendMovie:
        baseUrl = "https://api.themoviedb.org/3/movie/";
        authorize = false;
        break;
      case APIType.movieDetail:
        baseUrl = "https://api.themoviedb.org/3/movie/";
        authorize = false;
        break;
      case APIType.popularTheater:
        baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
        //path = '94f3c5b0c0011412ab4950d25a8cd4b9';
        authorize = false;
        break;
      case APIType.popularTV:
        baseUrl = "https://api.themoviedb.org/3/tv/popular?api_key=$apiKey";
        //path = '94f3c5b0c0011412ab4950d25a8cd4b9';
        authorize = false;
        break;
      case APIType.search:
        baseUrl = "https://api.themoviedb.org/3/search/multi?api_key=$apiKey";
        //path = '94f3c5b0c0011412ab4950d25a8cd4b9';
        authorize = false;
        break;
      case APIType.getToken:
        baseUrl =
            "https://api.themoviedb.org/3/authentication/token/new?api_key=";
        authorize = false;
        break;
      case APIType.validate:
        method = APIMethod.post;
        baseUrl =
            "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=";
        responseType = ResponseType.json;
        authorize = false;
        break;
      case APIType.test:
        path = "/get";
        baseUrl = "http://httpbin.org";
        authorize = false;
        break;
      case APIType.testPost:
        method = APIMethod.post;
        path = "/post";
        responseType = ResponseType.plain;
        baseUrl = "http://httpbin.org";
        authorize = false;
        break;
      case APIType.placementDetail:
        baseUrl = "https://test.vinceredev.com/api/v2";
        path = "/placement";
        break;
      case APIType.allOwners:
        baseUrl = "https://test.vinceredev.com/api/v2";
        path = "/user/summaries/all";
        break;
    }
    final options = Options(
            extra: {RequestExtraKeys.authorize: authorize},
            responseType: responseType,
            method: this.method ?? method)
        .compose(
      baseOption,
      path,
    );
    if (baseUrl != null) {
      options.baseUrl = baseUrl!;
    }
    return options;
  }
}

abstract class APIRouteConfigurable {
  RequestOptions? getConfig(BaseOptions baseOption);
}

class APIMethod {
  static const get = 'get';
  static const post = 'post';
  static const put = 'put';
  static const patch = 'patch';
  static const delete = 'delete';
}
