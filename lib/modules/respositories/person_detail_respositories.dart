import 'package:flutter_boilerplate/api/api_client.dart';
import 'package:flutter_boilerplate/api/api_response.dart';
import 'package:flutter_boilerplate/api/api_route.dart';

import '../event/model/person_detail.dart';

class PersonDetailRepositories {
  APIClient apiClient = APIClient();
  Future<PersonDetailModel?> getPersonDetail(num personId) async {
    String apiKey = '94f3c5b0c0011412ab4950d25a8cd4b9';
    try {
      final response = await apiClient.request(
          route: APIRoute(APIType.personDetail),
          extraPath: '$personId?api_key=$apiKey',
          create: (response) => APIResponse<PersonDetailModel?>(
              createObject: PersonDetailModel(), response: response));
      return response.decodedData!;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
