import 'package:equatable/equatable.dart';
import 'package:isssApps/data/models/artWorkModel/art_work_model.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

class ArtWorkStateModel extends Equatable {
  ArtWorkStateModel(
      {this.dropdownItemList = const [], this.artWorkSingleModel});

  List<SelectionPopupModel> dropdownItemList;
  ArtWorkSingleModel? artWorkSingleModel;

  ArtWorkStateModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return ArtWorkStateModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      artWorkSingleModel: artWorkSingleModel ?? this.artWorkSingleModel,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, artWorkSingleModel];
}
