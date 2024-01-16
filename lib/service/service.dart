import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_big_io_mobile_dev/models/get_list_models.dart';

class InfoListService {
  static const String _baseUrl = 'https://rickandmortyapi.com/api/character';

  List<Result> infoList = [];
  List<Result> searchedName = [];
  String searchText = '';

  static Future<List<Result>> fetchList() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/?page=1'));
      final body = response.body;
      // print(body);
      final result = jsonDecode(body);
      List<Result> listUser = List<Result>.from(
        result['results'].map(
          (list) => Result.fromMap(list),
        ),
      );
      return listUser;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  updateData() {
    if (searchText.isEmpty) {
      searchedName.addAll(infoList);
    } else {
      searchedName.addAll(infoList
          .where((element) => element.name.toLowerCase().startsWith(searchText))
          .toList());
    }
  }

  search(String name) {
    searchText = name;
    updateData();
  }
}



// class Location {
//   static const String _baseUrl = 'https://rickandmortyapi.com/api/character';
//   static Future<Location> fetchList() async {
//     try {
//       final response = await http.get(Uri.parse('$_baseUrl/?page=1'));
//       final body = response.body;

//       // ignore: avoid_print
//       print(body);

//       final result = jsonDecode(body);
//       List<Location> listUser = List<Location>.from(
//         result['location'].map(
//           (list) => Location.fromMap(list),
//         ),
//       );
//       return listUser;
//     } catch (e) {
//       throw Exception(
//         e.toString(),
//       );
//     }
//   }
// }