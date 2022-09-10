import 'package:flutter_boilerplate/api/api_client.dart';
import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

class TrendingRepositories {
  APIClient apiClient = APIClient();
  Future<MoviesResultModel?> getTrendingDay() async {
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.trendingDay),
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<MoviesResultModel?> getTrendingWeek() async {
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.trendingWeek),
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
