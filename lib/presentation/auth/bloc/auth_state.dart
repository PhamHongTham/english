part of 'auth_bloc.dart';

abstract class AuthState {}

//trạng thái ban đầu khi không có xác thực nào được thực hiện
class AuthInitial extends AuthState {}

//trạng thái khi xác thực thành công
class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess({required this.user});
}

//trạng thái khi xác thực thất bại.
class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

//trạng thái khi xác thực thành công và tên đầy đủ và email của người dùng
class AuthSuccessWithName extends AuthSuccess {
  final String fullName;
  final String email;

  AuthSuccessWithName(
      {required User user, required this.fullName, required this.email})
      : super(user: user);
}

class SignOutState extends AuthState {}
