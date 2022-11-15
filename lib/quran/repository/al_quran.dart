import 'dart:convert';

import 'package:tests/model/list_surah_model.dart';
import 'package:http/http.dart' as http;

import '../../model/detail_surah_model.dart';

class QuranRepository {
  QuranRepository();
  final String suratUrl = "https://equran.id/api/surat";

  Future<List<ListSurahModel>> getListSurah() async {
    try {
      final url = Uri.parse(suratUrl);
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final suratQuran =
            json.map((e) => ListSurahModel.fromJson(e)).toList();
        return suratQuran;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
   Future<DetailSurah> detailSurah(String urlId) async {
    try {
      final url = Uri.parse("https://equran.id/api/surat/$urlId");
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        DetailSurah surah = DetailSurah.fromJson(data);
        return surah;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class DetailRepository {
 
}
