import 'package:flutter_boilerplate/api/api_client.dart';
import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';
import 'package:flutter_boilerplate/api/decodable.dart';

import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

class UserRepositories {
  final String apiKey = "94f3c5b0c0011412ab4950d25a8cd4b9";
  APIClient apiClient = APIClient();
  Future<String> getToken() async {
    try {
      final response = await apiClient.request<APIResponse<GetToken>>(
        route: APIRoute(APIType.getToken),
        extraPath: apiKey,
        create: (response) =>
            APIResponse(response: response, createObject: GetToken()),
      );
      return response.decodedData!.requestToken!;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<GetStatus?> login(
      String userName, String password, String requestToken) async {
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.validate),
          extraPath: apiKey,
          body: {
            "username": userName,
            "password": password,
            "request_token": requestToken,
          },
          create: (_) =>
              APIResponse<GetStatus?>(response: _, createObject: GetStatus()));
      return response.decodedData!;
    } catch (e) {
      if (e is ErrorResponse) {
        print(e.originalResponse!.statusMessage);
        return e.decodedData!;
      }
    }
    return null;
  }
}

class GetToken extends Decoder<GetToken> {
  bool? success;
  String? expiresAt;
  String? requestToken;

  @override
  String toString() {
    return '$requestToken';
  }

  GetToken({this.success, this.expiresAt, this.requestToken});
  @override
  GetToken decode(Map<String, dynamic> json) => GetToken(
      success: json['success'],
      expiresAt: json['expires_at'],
      requestToken: json['request_token']);
}

class GetStatus extends Decoder<GetStatus> {
  bool? success;
  String? statusMessage;
  GetStatus({this.success, this.statusMessage});
  @override
  GetStatus decode(Map<String, dynamic> json) => GetStatus(
        success: json['success'],
        statusMessage: json['status_message'],
      );
}
