part of 'user_bloc.dart';

// abstract class UserState extends Equatable {
//   const UserState();

//   @override
//   List<Object> get props => [];
// }

// class UserInitial extends UserState {}

// class LoadedState extends UserState {
//   final String fullName;
//   final String email;

//   LoadedState({required this.fullName, required this.email});
// }

// abstract class UserState extends Equatable {
//   const UserState();

//   @override
//   List<Object> get props => [];
// }

// class UserInitial extends UserState {}

// class LoadedState extends UserState {
//   final String fullName;
//   final String email;

//   const LoadedState({required this.fullName, required this.email});

//   @override
//   List<Object> get props => [fullName, email];
// }

// abstract class UserState extends Equatable {
//   const UserState();

//   @override
//   List<Object> get props => [];
// }

// class UserInitial extends UserState {}

// class LoadedState extends UserState {
//   final String fullName;
//   final String email;
//   final String? birthday; // Add this line

//   const LoadedState({
//     required this.fullName,
//     required this.email,
//     this.birthday, // Add this line
//   });

//   @override
//   List<Object> get props => [fullName, email, birthday ?? '']; // Add this line
// }

// class ChooseDateOfBirthState extends UserState {
//   final String dateOfBirth;

//   const ChooseDateOfBirthState({required this.dateOfBirth});

//   @override
//   List<Object> get props => [dateOfBirth];
// }

// class UserNotificationSwitchChanged extends UserState {
//   final Map<String, bool> switchStates;

//   UserNotificationSwitchChanged({required this.switchStates});

//   @override
//   List<Object> get props => [switchStates];
// }

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserProfileUpdated extends UserState {}

class UserProfileUpdateFailure extends UserState {
  final String error;

  const UserProfileUpdateFailure(this.error);

  @override
  List<Object> get props => [error];
}

class ChooseDateOfBirthState extends UserState {
  final String dateOfBirth;

  const ChooseDateOfBirthState({required this.dateOfBirth});

  @override
  List<Object> get props => [dateOfBirth];
}

class UserNotificationSwitchChanged extends UserState {
  final Map<String, bool> switchStates;

  const UserNotificationSwitchChanged({required this.switchStates});

  @override
  List<Object> get props => [switchStates];
}
