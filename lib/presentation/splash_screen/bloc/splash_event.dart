part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashInitialEvent extends SplashEvent {}
