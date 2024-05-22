part of 'signin_signup_bloc.dart';

abstract class SigninSignupState extends Equatable {
  const SigninSignupState();
  
  @override
  List<Object> get props => [];
}

class SigninSignupInitial extends SigninSignupState {}
