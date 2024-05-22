import 'package:english/components/options/appBar/appBar.dart';
import 'package:english/components/options/buildProfileImages/buildProfileImages.dart';
import 'package:english/components/options/build_ProfileOptions/build_ProfileOptions.dart';
import 'package:english/presentation/auth/bloc/auth_bloc.dart';
import 'package:english/presentation/payment/bloc/payment_bloc.dart';
import 'package:english/presentation/payment/payment_screent.dart';
import 'package:english/presentation/signin_signup/bloc/bloc/signin_signup_bloc.dart';
import 'package:english/presentation/signin_signup/bloc/signin_signup.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/presentation/user_screen.dart/edit_screen.dart';
import 'package:english/presentation/user_screen.dart/notification.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserScreen extends StatelessWidget {
  final String fullName;
  final String email;
  const UserScreen({
    Key? key,
    required UserBloc userBloc,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
            child: Column(
              children: [
                const appBar(
                  icon: Icons.keyboard_backspace_sharp,
                  text: 'Profile',
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      width: 360.w,
                      height: 720.h,
                      decoration: BoxDecoration(
                        color: ColorSchemes.primaryColorScheme.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 85.0, horizontal: 30.0),
                        children: [
                          Text(fullName,
                              style: AppStyle.title1,
                              textAlign: TextAlign.center),
                          SizedBox(width: 14.w),
                          Text(email,
                              style: AppStyle.title1,
                              textAlign: TextAlign.center),
                          SizedBox(height: 50.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EditScreen(
                                          userBloc: UserBloc(),
                                          fullName: fullName,
                                          email: email,
                                        )),
                              );
                            },
                            child: const build_ProfileOption(
                                icon: Icons.person_2_outlined,
                                text: 'Edit Profile'),
                          ),
                          SizedBox(height: 37.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen(
                                          userBloc: UserBloc(),
                                          paymentBloc: PaymentBloc(),
                                        )),
                              );
                            },
                            child: const build_ProfileOption(
                                icon: Icons.payment_outlined,
                                text: 'Payment Option'),
                          ),
                          SizedBox(height: 37.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => NotificationScreen(
                                          userBloc: UserBloc(),
                                          fullName: fullName,
                                          email: email,
                                        )),
                              );
                            },
                            child: const build_ProfileOption(
                                icon: Icons.notifications_none,
                                text: 'Notifications'),
                          ),
                          SizedBox(height: 37.h),
                          const build_ProfileOption(
                              icon: Icons.security_rounded, text: 'Security'),
                          SizedBox(height: 37.h),
                          const build_ProfileOption(
                              icon: Icons.language_outlined, text: 'Language'),
                          SizedBox(height: 37.h),
                          const build_ProfileOption(
                              icon: Icons.device_thermostat_sharp,
                              text: 'Terms & Conditions'),
                          SizedBox(height: 37.h),
                          const build_ProfileOption(
                              icon: Icons.help_outline_sharp,
                              text: 'Help Center'),
                          SizedBox(height: 37.h),
                          const build_ProfileOption(
                              icon: Icons.mail, text: 'Intive Friends'),
                          SizedBox(height: 37.h),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(AuthSignOutEvent());
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => SignInSignUpScreen(
                                            signinSignupBloc:
                                                SigninSignupBloc(),
                                          )),
                                  (route) => false);
                            },
                            child: const build_ProfileOption(
                                icon: Icons.logout, text: 'Log out'),
                          ),
                        ],
                      ),
                    ),
                    buildProfileImages(
                      width: 36.0.w,
                      height: 36.0.h,
                      left: 125.w,
                      right: 125.w,
                      bottom: 640.h,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
