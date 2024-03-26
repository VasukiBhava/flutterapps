import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/data/models/artWorkModel/art_work_model.dart';

import '../../data/data_sources/remote/artworks.dart';

class ArtWorkRepository {
  final ArtWorkRepositoryDataSource dataSource;

  ArtWorkRepository({required this.dataSource});

  Future<List<SelectionPopupModel>> getArtWorks() {
    return dataSource.getArtWorkFromApi();
  }

  Future<ArtWorkSingleModel> getArtWorksById(id) {
    return dataSource.getArtWorkById(id);
  }
}
