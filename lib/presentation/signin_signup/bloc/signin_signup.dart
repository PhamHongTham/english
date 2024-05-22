import 'package:english/components/button/custom_button.dart';
import 'package:english/components/button/custom_gg.dart';
import 'package:english/components/google/goole.dart';
import 'package:english/components/text_title/text_title.dart';
import 'package:english/gen/assets.gen.dart';
import 'package:english/presentation/auth/bloc/auth_bloc.dart';
import 'package:english/presentation/auth/signin.dart';
import 'package:english/presentation/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:english/presentation/signin_signup/bloc/bloc/signin_signup_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class SignInSignUpScreen extends StatelessWidget {
  final SigninSignupBloc signinSignupBloc;
  const SignInSignUpScreen({Key? key, required this.signinSignupBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocBuilder<OnboardingBloc, OnboardingStates>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 73.0, horizontal: 31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: SvgPicture.asset(Assets.images.amico)),
              const SizedBox(height: 33.0),
              Text_Title(
                text: 'Selamat Datang\nMember StudyTeach',
                style: AppStyle.titleSignInSignUp,
              ),
              const SizedBox(height: 15.0),
              Text_Title(
                text:
                    'Pendidikan adalah paspor untuk masa\ndepan, karena hari esok adalah milik\nmereka yang mempersiapkannya hari ini.',
                style: AppStyle.desSignInSignUp,
              ),
              const SizedBox(height: 78.0),
              // Center(
              //   child: CustomGoogle(
              //     text: 'Sign in with Google',
              //     style: AppStyle.signInSignUp,
              //     width: 315.w,
              //     height: 45.h,
              //     color: ColorSchemes.primaryColorScheme.secondary,
              //     onPressed: () {},
              //   ),
              // ),
              Center(
                child: CustomGoogle(
                  text: 'Sign in with Google',
                  style: AppStyle.signInSignUp,
                  width: 315.w,
                  height: 45.h,
                  color: ColorSchemes.primaryColorScheme.secondary,
                  onPressed: () async {
                    UserCredential? userCredential = await signInWithGoogle();
                    if (userCredential != null) {
                      // Đăng nhập thành công, thực hiện các tác vụ khác nếu cần
                    } else {
                      // Đăng nhập không thành công hoặc đã bị hủy
                    }
                  },
                ),
              ),

              const SizedBox(height: 26.0),
              Center(
                child: Custom_button(
                  width: 315.w,
                  height: 45.h,
                  color: AppColor.buttonB,
                  borderRadius: BorderRadius.circular(10.0),
                  text: 'Create an account',
                  style: AppStyle.buttonB,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 500),
                          child: SignIn(
                            authBloc: BlocProvider.of<AuthBloc>(context),
                          ),
                        ));
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //       builder: (context) => SignIn(
                    //             authBloc: AuthBloc(),
                    //           )),
                    // );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
