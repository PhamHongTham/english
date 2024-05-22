import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signin_signup_event.dart';
part 'signin_signup_state.dart';

class SigninSignupBloc extends Bloc<SigninSignupEvent, SigninSignupState> {
  SigninSignupBloc() : super(SigninSignupInitial());

  @override
  Stream<SigninSignupState> mapEventToState(
    SigninSignupEvent event,
  ) async* {}
}
