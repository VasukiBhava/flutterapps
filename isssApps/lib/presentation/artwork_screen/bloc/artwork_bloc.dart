// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/domain/repository/artWork_repo.dart';

import 'artwork_event.dart';
import 'artwork_state.dart';

class ArtWorkBloc extends Bloc<ArtWorkEvent, ArtWorkState> {
  ArtWorkBloc(ArtWorkState initialState, this.repository)
      : super(initialState) {
    on<ArtWorkInitializeEvent>(_onInitialize);
    on<ArtWorkLoaded>(_callFetchMe);
    on<ChangeDropDownEvent>(_changeDropDown);
  }
  final ArtWorkRepository repository;

  _onInitialize(
    ArtWorkInitializeEvent event,
    Emitter<ArtWorkState> emit,
  ) async {
    emit(state.copyWith(ArtWorkModelObj: state.artWorkModelObj));
    // add(ArtWorkLoaded(
    //   ArtWorkEventError: () {
    //     _onFetchMeEventError("Something Went Wrong");
    //   },
    // ), null);
  }

  FutureOr<void> _callFetchMe(
    ArtWorkLoaded event,
    Emitter<ArtWorkState> emit,
  ) async {
    await repository.getArtWorks().then((value) async {
      print('value $value');
      emit(
        state.copyWith(selectedDropDownList: value),
      );
    }).onError((error, stackTrace) {
      _onFetchMeError();
      event.ArtWorkEventError.call();
    });
  }

  void _onFetchMeError() {
    //implement error method body...
  }
  void _onFetchMeEventError(message) {}

  FutureOr<void> _changeDropDown(
      ChangeDropDownEvent event, Emitter<ArtWorkState> emit) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }
}