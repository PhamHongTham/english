part of 'auth_bloc.dart';

abstract class AuthEvent {}

//sự kiện xác thực để đăng ký
class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInEvent({required this.email, required this.password});
}

//sự kiện xác thực để đăng nhập
class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;

  AuthSignUpEvent(this.fullName, this.phoneNumber,
      {required this.email, required this.password});
}

//sự kiện xác thực để đăng xuất
class AuthSignOutEvent extends AuthEvent {}
