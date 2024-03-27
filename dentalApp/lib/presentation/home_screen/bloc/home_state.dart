// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.nameController,
    this.dateController,
    this.chooseProblemController,
    this.chooseTestController,
    this.chooseConsultationController,
    this.homeModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? nameController;

  TextEditingController? dateController;

  TextEditingController? chooseProblemController;

  TextEditingController? chooseTestController;

  TextEditingController? chooseConsultationController;

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [
        searchController,
        nameController,
        dateController,
        chooseProblemController,
        chooseTestController,
        chooseConsultationController,
        homeModelObj,
      ];

  HomeState copyWith({
    TextEditingController? searchController,
    TextEditingController? nameController,
    TextEditingController? dateController,
    TextEditingController? chooseProblemController,
    TextEditingController? chooseTestController,
    TextEditingController? chooseConsultationController,
    HomeModel? homeModelObj,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      nameController: nameController ?? this.nameController,
      dateController: dateController ?? this.dateController,
      chooseProblemController:
          chooseProblemController ?? this.chooseProblemController,
      chooseTestController: chooseTestController ?? this.chooseTestController,
      chooseConsultationController:
          chooseConsultationController ?? this.chooseConsultationController,
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}
