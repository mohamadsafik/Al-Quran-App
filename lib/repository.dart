import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tests/models/location_model.dart';

class LocationRepository {
  final String baseUrl =
      "https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json";

  Future<List<LocationModel>> getLocation() async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final weathers = json.map((e) => LocationModel.fromJson(e)).toList();
        return weathers;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
