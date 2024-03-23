import '../../data/data_sources/remote/artworks.dart';

class ArtWorkRepository {
  final ArtWorkRepositoryDataSource dataSource;

  ArtWorkRepository({required this.dataSource});

  Future<List> getArtWorks() {
    return dataSource.getArtWorkFromApi();
  }
}