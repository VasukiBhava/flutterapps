// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isssApps/presentation/artwork_screen/models/artwork_model.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

class ArtWorkState extends Equatable {
  ArtWorkState({
    this.nameController,
    this.linkController,
    this.groupController,
    this.valueController,
    this.selectedDropDownValue,
    this.selectedDropDownList,
    this.artWorkModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? linkController;

  TextEditingController? groupController;

  TextEditingController? valueController;

  SelectionPopupModel? selectedDropDownValue;
  List<SelectionPopupModel>? selectedDropDownList;

  ArtWorkStateModel? artWorkModelObj;

  @override
  List<Object?> get props => [
        nameController,
        linkController,
        groupController,
        valueController,
        selectedDropDownValue,
        selectedDropDownList,
        artWorkModelObj,
      ];
  ArtWorkState copyWith({
    TextEditingController? nameController,
    TextEditingController? linkController,
    TextEditingController? groupController,
    TextEditingController? valueController,
    SelectionPopupModel? selectedDropDownValue,
    List<SelectionPopupModel>? selectedDropDownList,
    ArtWorkStateModel? artWorkModelObj,
  }) {
    return ArtWorkState(
      nameController: nameController ?? this.nameController,
      linkController: linkController ?? this.linkController,
      groupController: groupController ?? this.groupController,
      valueController: valueController ?? this.valueController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownList: selectedDropDownList ?? this.selectedDropDownList,
      artWorkModelObj: artWorkModelObj ?? this.artWorkModelObj,
    );
  }
}
