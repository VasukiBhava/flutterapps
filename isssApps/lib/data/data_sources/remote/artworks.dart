import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isssApps/core/app_export.dart';

class ArtWorkRepositoryDataSource {
  Future<List<SelectionPopupModel>> getArtWorkFromApi() async {
    // Placeholder API URL for demonstration
    final url =
        Uri.parse('https://api.artic.edu/api/v1/artworks?page=1&limit=10');
    print(url);
    try {
      final response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<SelectionPopupModel> popupList = [];
        for (var i in data['data']) {
          popupList.add(SelectionPopupModel(
              id: i['id'], title: i['title'], isSelected: false));
        }
        // Extracting the title field for demonstration
        return popupList;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
