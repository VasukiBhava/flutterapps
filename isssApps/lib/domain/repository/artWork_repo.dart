import 'package:isssApps/core/app_export.dart';

import '../../data/data_sources/remote/artworks.dart';

class ArtWorkRepository {
  final ArtWorkRepositoryDataSource dataSource;

  ArtWorkRepository({required this.dataSource});

  Future<List<SelectionPopupModel>> getArtWorks() {
    return dataSource.getArtWorkFromApi();
  }
}
