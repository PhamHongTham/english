import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial());

//   @override
//   Stream<UserState> mapEventToState(UserEvent event) async* {
//     // Handle events if needed
//   }

//   // Add a method to update the state with fullName and email
//   void updateUserProfile(String fullName, String email) {
//     emit(LoadedState(fullName: fullName, email: email));
//   }
// }

//------------------------//
// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial());

//   @override
//   void onEvent(UserEvent event) {
//     super.onEvent(event);
//     if (event is UpdateUserProfileEvent) {
//       // Assuming you have a method to update the user profile
//       // This is where you can perform any business logic
//       updateUserProfile(event.fullName, event.email);

//       // Emit a new state reflecting the updated user profile
//       emit(LoadedState(fullName: event.fullName, email: event.email));
//     }
//   }

//   void updateUserProfile(String fullName, String email) {
//     // Your logic to update the user profile
//   }

// }
class UserBloc extends Bloc<UserEvent, UserState> {
  // bool switchValue = false;
  Map<String, bool> switchStates = {};
  TextEditingController birthdayController = TextEditingController();

  UserBloc() : super(UserInitial()) {
    on<ChooseDateOfBirthEvent>(_chooseDateOfBirth);
    on<NotificationSwitchChangedEvent>(_notificationSwitchChanged);
  }

  Future<void> _chooseDateOfBirth(event, emit) async {
    if (event is ChooseDateOfBirthEvent) {
      final dateOfBirth = event.dateOfBirth;
      birthdayController.text =
          "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}";
      emit(ChooseDateOfBirthState(dateOfBirth: birthdayController.text));
    }
  }

  Future<void> _notificationSwitchChanged(
      UserEvent event, Emitter<UserState> emit) async {
    if (event is NotificationSwitchChangedEvent) {
      switchStates[event.rowId] = event.switchValue;
      print('Switch States after change: $switchStates');
      emit(UserNotificationSwitchChanged(switchStates: Map.from(switchStates)));
    }
  }

  void updateUserProfile(String fullName, String email) {
    // Your logic to update the user profile
  }

  String updateBirthday(String newBirthday) {
    // Your logic to update the user's birthday
    // For example, you might want to store it in a variable or database
    // Return the updated birthday
    return newBirthday;
  }
}


 // void _notificationSwitchChanged(
  //     NotificationSwitchChangedEvent event, Emitter<UserState> emit) {
  //   // Debugging: Print statements to check the flow
  //   print('Switch Value before change: $switchValue');
  //   switchValue = event.switchValue;
  //   print('Switch Value after change: $switchValue');

  //   emit(UserNotificationSwitchChanged(switchValue));
  // }
  // @override
  // void onEvent(UserEvent event) {
  //   super.onEvent(event);
  //   if (event is UpdateUserProfileEvent) {
  //     updateUserProfile(event.fullName, event.email);
  //     emit(LoadedState(
  //       fullName: event.fullName,
  //       email: event.email,
  //     ));
  //   } else if (event is ChooseDateOfBirthEvent) {
  //     final dateOfBirth = event.dateOfBirth;
  //     emit(ChooseDateOfBirthState(
  //         dateOfBirth:
  //             "${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}}"));
  //     String updatedBirthday = updateBirthday(event.newBirthday);
  //     emit(LoadedState(
  //       fullName: (state as LoadedState).fullName,
  //       email: (state as LoadedState).email,
  //       birthday: updatedBirthday,
  //     ));
  //   }
  // }

  
