import 'dart:convert';

import 'package:tests/quran/model/surat_quran_model.dart';
import 'package:http/http.dart' as http;

import '../model/detail_surah_model.dart';

class QuranRepository {
  final String suratUrl = "https://equran.id/api/surat";
  final String ayatUrl = "https://equran.id/api/surat/1";

  Future<List<SuratQuranModel>> getSurat() async {
    try {
      final url = Uri.parse(suratUrl);
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final suratQuran =
            json.map((e) => SuratQuranModel.fromJson(e)).toList();
        return suratQuran;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<DetailSurah> getAyat(String urlId) async {
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
