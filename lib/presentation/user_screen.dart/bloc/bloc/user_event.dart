part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserProfileEvent extends UserEvent {
  final String fullName;
  final String email;

  UpdateUserProfileEvent({required this.fullName, required this.email});

  @override
  List<Object> get props => [fullName, email];
}

class UpdateUserBirthdayEvent extends UserEvent {
  final String newBirthday;

  UpdateUserBirthdayEvent({required this.newBirthday});

  @override
  List<Object> get props => [newBirthday];
}

class ChooseDateOfBirthEvent extends UserEvent {
  final DateTime dateOfBirth;

  ChooseDateOfBirthEvent({required this.dateOfBirth});

  @override
  List<Object> get props => [dateOfBirth];
}

class NotificationSwitchChangedEvent extends UserEvent {
  final String rowId;
  final bool switchValue;

  NotificationSwitchChangedEvent(
      {required this.rowId, required this.switchValue});

  @override
  List<Object> get props => [rowId, switchValue];
}
