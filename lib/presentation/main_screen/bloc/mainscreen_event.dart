part of 'mainscreen_bloc.dart';

abstract class MainscreenEvent extends Equatable {
  const MainscreenEvent();

  @override
  List<Object> get props => [];
}

class MainscreenInitialEvent extends MainscreenEvent {}
