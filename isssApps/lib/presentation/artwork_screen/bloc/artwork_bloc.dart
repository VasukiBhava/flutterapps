import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:isssApps/domain/repository/artWork_repo.dart';
import 'package:meta/meta.dart';

import 'artwork_event.dart';
import 'artwork_state.dart';

class ArtWorkBloc extends Bloc<ArtWorkEvent, ArtWorkState> {
  final ArtWorkRepository repository;

  ArtWorkBloc({required this.repository}) : super(ArtWorkInitial());

  Stream<ArtWorkState> mapEventToState(ArtWorkEvent event) async* {
    if (event is GetArtWorks) {
      yield DropdownLoading();
      try {
        final dropdownValues = await repository.getArtWorks();
        yield ArtWorkLoaded(values: dropdownValues);
      } catch (_) {
        yield ArtWorkError();
      }
    }
  }
}




