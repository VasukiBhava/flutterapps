import 'dart:convert';
import 'package:http/http.dart' as http;

class ArtWorkRepositoryDataSource {
  Future<List> getArtWorkFromApi() async {
    // Placeholder API URL for demonstration
    final url = Uri.parse('https://api.artic.edu/api/v1/artworks?page=1&limit=10');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        // Extracting the title field for demonstration
        return data.map((item) => item['data']).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
