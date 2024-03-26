import 'package:equatable/equatable.dart';
import 'package:isssApps/core/app_export.dart';

abstract class ArtWorkEvent extends Equatable {
  const ArtWorkEvent();

  @override
  List<Object> get props => [];
}

class ArtWorkInitializeEvent extends ArtWorkEvent {
  const ArtWorkInitializeEvent();
}

class ArtWorkLoaded extends ArtWorkEvent {
  ArtWorkLoaded({required this.ArtWorkEventError});

  Function ArtWorkEventError;

  @override
  List<Object> get props => [
        ArtWorkEventError,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends ArtWorkEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;
  @override
  List<Object> get props => [
        value,
      ];
}
