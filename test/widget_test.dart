// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:tests/quran/model/ayat_model.dart';

// void main() async {
//   // Future getAyat() async {
//   final url = Uri.parse("https://equran.id/api/surat/1");
//   final response = await http.get(
//     url,
//   );
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     DetailSurah surah = DetailSurah.fromJson(data);

//     print(data["ayat"]);
//     // print(surah);
//   } else {
//     throw Exception(response.body);
//   }
// }
// // }
