part of 'splash_bloc.dart';

@immutable
abstract class SplashState {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashSuscess extends SplashState {}

class Logged extends SplashState {}

class NotLogged extends SplashState {}
