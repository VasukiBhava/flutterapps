import 'package:equatable/equatable.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

class ArtWorkStateModel extends Equatable {
  ArtWorkStateModel({this.dropdownItemList = const []});

  List<SelectionPopupModel> dropdownItemList;

  ArtWorkStateModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return ArtWorkStateModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
