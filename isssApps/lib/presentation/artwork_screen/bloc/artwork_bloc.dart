// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:isssApps/core/app_export.dart';
import 'package:isssApps/domain/repository/artWork_repo.dart';

import '../models/artwork_model.dart';
import 'artwork_event.dart';
import 'artwork_state.dart';

class ArtWorkBloc extends Bloc<ArtWorkEvent, ArtWorkState> {
  ArtWorkBloc(ArtWorkState initialState, this.repository)
      : super(initialState) {
    on<ArtWorkInitializeEvent>(_onInitialize);
    on<ArtWorkLoaded>(_callFetchMe);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ArtWorkSingleEvent>(_callFetchSingleArtWork);
  }
  final ArtWorkRepository repository;

  _onInitialize(
    ArtWorkInitializeEvent event,
    Emitter<ArtWorkState> emit,
  ) async {
    emit(state.copyWith(artWorkModelObj: state.artWorkModelObj));
    add(
      ArtWorkLoaded(
        ArtWorkEventError: () {
          _onFetchMeEventError("Something Went Wrong");
        },
      ),
    );
  }

  FutureOr<void> _callFetchMe(
    ArtWorkLoaded event,
    Emitter<ArtWorkState> emit,
  ) async {
    await repository.getArtWorks().then((value) async {
      emit(
        state.copyWith(
            artWorkModelObj: ArtWorkStateModel(dropdownItemList: value)),
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
    add(
      ArtWorkSingleEvent(
        ArtWorkEventError: () {
          _onFetchMeEventError("Something Went Wrong");
        },
      ),
    );
  }

  FutureOr<void> _callFetchSingleArtWork(
    ArtWorkSingleEvent event,
    Emitter<ArtWorkState> emit,
  ) async {
    await repository
        .getArtWorksById(state.selectedDropDownValue?.id)
        .then((value) async {
      emit(
        state.copyWith(
          nameController: TextEditingController(text: value.artistDisplay),
          linkController: TextEditingController(text: value.artworkTypeTitle),
          groupController: TextEditingController(text: value.artistDisplay),
          valueController: TextEditingController(text: value.artistDisplay),
        ),
      );
    }).onError((error, stackTrace) {
      _onFetchMeError();
      event.ArtWorkEventError.call();
    });
  }
}
