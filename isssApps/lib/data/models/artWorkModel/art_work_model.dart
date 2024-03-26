class ArtWorkSingleModel {
  int? id;
  String? apiModel;
  String? title;
  String? artistDisplay;
  String? placeOfOrigin;
  String? artworkTypeTitle;
  String? departmentTitle;
  String? artistTitle;
  String? classificationTitle;

  ArtWorkSingleModel(
      {this.id,
      this.apiModel,
      this.title,
      this.artistDisplay,
      this.placeOfOrigin,
      this.artworkTypeTitle,
      this.departmentTitle,
      this.artistTitle,
      this.classificationTitle});

  ArtWorkSingleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiModel = json['api_model'];
    title = json['title'];
    artistDisplay = json['artist_display'];
    placeOfOrigin = json['place_of_origin'];
    artworkTypeTitle = json['artwork_type_title'];
    departmentTitle = json['department_title'];
    artistTitle = json['artist_title'];
    classificationTitle = json['classification_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api_model'] = this.apiModel;
    data['title'] = this.title;
    data['artist_display'] = this.artistDisplay;
    data['place_of_origin'] = this.placeOfOrigin;
    data['artwork_type_title'] = this.artworkTypeTitle;
    data['department_title'] = this.departmentTitle;
    data['artist_title'] = this.artistTitle;
    data['classification_title'] = this.classificationTitle;
    return data;
  }
}
