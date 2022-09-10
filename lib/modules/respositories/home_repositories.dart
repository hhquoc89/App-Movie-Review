import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

import '../../api/api_client.dart';

class PopularRepositories {
  APIClient apiClient = APIClient();
  Future<MoviesResultModel?> getPopularMoviesTV(num page) async {
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.popularTV),
          extraPath: '&page=$page',
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<MoviesResultModel?> getPopularMoviesTheater(num page) async {
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.popularTheater),
          extraPath: '&page=$page',
          create: (response) => APIResponse<MoviesResultModel?>(
              createObject: MoviesResultModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
