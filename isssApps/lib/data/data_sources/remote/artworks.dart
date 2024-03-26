import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/data/models/artWorkModel/art_work_model.dart';

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

  Future<ArtWorkSingleModel> getArtWorkById(int id) async {
    // Placeholder API URL for demonstration
    final url = Uri.parse('https://api.artic.edu/api/v1/artworks/$id');
    print(url);
    try {
      final response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        ArtWorkSingleModel model = ArtWorkSingleModel(
            id: data['id'],
            apiModel: data['api_model'],
            title: data['title'],
            artistDisplay: data['artist_display'],
            placeOfOrigin: data['place_of_origin'],
            artworkTypeTitle: data['artwork_type_title'],
            departmentTitle: data['department_title'],
            artistTitle: data['artist_title'],
            classificationTitle: data['classification_title']);

        // Extracting the title field for demonstration
        return model;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
