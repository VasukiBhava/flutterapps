// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'grid_item_model.dart';
import 'person_item_model.dart';

/// This class defines the variables used in the [home_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({
    this.gridItemList = const [],
    this.personItemList = const [],
  });

  List<GirdItemModel> gridItemList;

  List<PersonItemModel> personItemList;

  HomeModel copyWith({
    List<GirdItemModel>? gridItemList,
    List<PersonItemModel>? personItemList,
  }) {
    return HomeModel(
      gridItemList: gridItemList ?? this.gridItemList,
      personItemList: personItemList ?? this.personItemList,
    );
  }

  @override
  List<Object?> get props => [gridItemList, personItemList];
}
