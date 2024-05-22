import 'package:english/components/notifications/notifications.dart';
import 'package:english/components/options/appBar/appBar.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  final String fullName;
  final String email;

  const NotificationScreen({
    Key? key,
    required UserBloc userBloc,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          Map<String, bool> switchStates = {};

          if (state is UserNotificationSwitchChanged) {
            switchStates = state.switchStates;
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const appBar(
                  icon: Icons.keyboard_backspace_sharp,
                  text: 'Notification',
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  width: 358.w,
                  height: 720.h,
                  decoration: BoxDecoration(
                    color: ColorSchemes.primaryColorScheme.secondary,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 68.h),
                    children: [
                      NotificationSwitchRow(
                        switchValue: switchStates['row1'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row1', switchValue: value));
                        },
                        text: 'Special Offers',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row2'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row2', switchValue: value));
                        },
                        text: 'Sound',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row3'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row3', switchValue: value));
                        },
                        text: 'Vibrate',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row4'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row4', switchValue: value));
                        },
                        text: 'General Notification',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row5'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row5', switchValue: value));
                        },
                        text: 'Promo & Discount',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row6'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row6', switchValue: value));
                        },
                        text: 'Payment Options',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row7'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row7', switchValue: value));
                        },
                        text: 'App Update',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row8'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row8', switchValue: value));
                        },
                        text: 'New Service Available',
                      ),
                      SizedBox(height: 30.h),
                      NotificationSwitchRow(
                        switchValue: switchStates['row9'] ?? false,
                        onSwitchChanged: (value) {
                          context.read<UserBloc>().add(
                              NotificationSwitchChangedEvent(
                                  rowId: 'row9', switchValue: value));
                        },
                        text: 'New Tips Available',
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
