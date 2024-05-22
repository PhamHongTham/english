part of 'mainscreen_bloc.dart';

abstract class MainState {}

class MainInitialState extends MainState {}

class MainIndexChangedState extends MainState {
  final int index;

  MainIndexChangedState({required this.index});
}

class MainBlocFailedState extends MainState {
  final String message;

  MainBlocFailedState({required this.message});
}

class MainLoggedState extends MainState {}
