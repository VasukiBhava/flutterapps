// States
import 'package:flutter/material.dart';

@immutable
abstract class ArtWorkState {}

class ArtWorkInitial extends ArtWorkState {}

class DropdownLoading extends ArtWorkState {}

class ArtWorkLoaded extends ArtWorkState {
  final List<dynamic> values;

  ArtWorkLoaded({required this.values});
}

class ArtWorkError extends ArtWorkState {}