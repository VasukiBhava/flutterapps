import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/grid_item_model.dart';
import '../models/home_model.dart';
import '../models/person_item_model.dart';
import '/core/app_export.dart';

part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  List<GirdItemModel> fillGridItemList() {
    return [
      GirdItemModel(
          dentalBraces: ImageConstant.imgNounBraces1507760,
          dentalBraces1: 'Dental Braces'),
      GirdItemModel(
          dentalBraces: ImageConstant.imgGroup1171274811,
          dentalBraces1: 'Dental Crown'),
      GirdItemModel(
          dentalBraces: ImageConstant.imgNounDentalFilling4504927,
          dentalBraces1: 'Dental Filling'),
      GirdItemModel(
          dentalBraces: ImageConstant.imgUser, dentalBraces1: 'Anesthesia')
    ];
  }

  List<PersonItemModel> fillPersonItemList() {
    return [
      PersonItemModel(
          drTracyAustin: ImageConstant.imgRectangle41903,
          drTracyAustin1: 'Dr. Tracy Austin',
          dentalSpecialist: 'Dental Specialist'),
      PersonItemModel(
          drTracyAustin: ImageConstant.imgRectangle41904,
          drTracyAustin1: 'Dr. Tracy Austin',
          dentalSpecialist: 'Dental Specialist'),
      PersonItemModel(
          drTracyAustin: ImageConstant.imgRectangle41905,
          drTracyAustin1: 'Dr. Tracy Austin',
          dentalSpecialist: 'Dental Specialist'),
      PersonItemModel(
          drTracyAustin: ImageConstant.imgRectangle41906,
          drTracyAustin1: 'Dr. Tracy Austin',
          dentalSpecialist: 'Dental Specialist')
    ];
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      nameController: TextEditingController(),
      dateController: TextEditingController(),
      chooseProblemController: TextEditingController(),
      chooseTestController: TextEditingController(),
      chooseConsultationController: TextEditingController(),
    ));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
      gridItemList: fillGridItemList(),
      personItemList: fillPersonItemList(),
    )));
  }
}
