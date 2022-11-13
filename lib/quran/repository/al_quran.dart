import 'dart:convert';

import 'package:tests/quran/model/surat_quran_model.dart';
import 'package:http/http.dart' as http;

import '../model/detail_surah_model.dart';

class QuranRepository {
  QuranRepository();
  final String suratUrl = "https://equran.id/api/surat";

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
}

class DetailRepository {
  String? urlId;

  final String ayatUrl = "https://equran.id/api/surat/1";
  Future<DetailSurah> getAyat() async {
    try {
      final url = Uri.parse("https://equran.id/api/surat/1");
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
