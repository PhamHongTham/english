import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english/components/button/custom_button.dart';
import 'package:english/components/custom_text/custom_text.dart';
import 'package:english/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:english/components/custom_text_form_field/custom_text_form_field_password.dart';
import 'package:english/components/icons_texts/icons_texts.dart';
import 'package:english/components/text_title/text_title.dart';
import 'package:english/presentation/auth/bloc/auth_bloc.dart';
import 'package:english/presentation/auth/signup.dart';
import 'package:english/presentation/main_screen/bloc/mainscreen_bloc.dart';
import 'package:english/presentation/main_screen/main_screen.dart';
import 'package:english/them/them_helper.dart';
import 'package:english/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class CustomSignIn extends StatelessWidget {
  const CustomSignIn({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessWithName) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                fullName: state.fullName,
                mainBloc: MainBloc(),
                email: state.user.email!,
              ),
            ),
          );
        } else if (state is AuthFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: const Text('Đăng nhập thất bại'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 40.0),
          width: double.infinity,
          height: 530.0,
          decoration: BoxDecoration(
            color: ColorSchemes.primaryColorScheme.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(60.0),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text_Title(
                    text: 'Welcome Back',
                    style: AppStyle.textWelcom,
                  ),
                  Text_Title(
                    text: 'Hello there, sign in continue',
                    style: AppStyle.textInput,
                  ),
                  const SizedBox(height: 53.0),
                  IconText(
                    icon: Icons.person_3_outlined,
                    text: 'Email',
                    style: AppStyle.textEmail_Password,
                    color: ColorSchemes.primaryColorScheme.onPrimary,
                  ),
                  const SizedBox(height: 7.0),
                  Text_Form_Field(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      print('Email: $value');
                    },
                    textInputAction: TextInputAction.next,
                    validator: Validator.emailValidator,
                    fillColor: ColorSchemes.primaryColorScheme.outline,
                    hintText: 'Enter your username or email',
                    hintStyle: AppStyle.textFormField,
                  ),
                  const SizedBox(height: 39.0),
                  IconText(
                    icon: Icons.lock_person_outlined,
                    text: 'Password',
                    style: AppStyle.textEmail_Password,
                    color: ColorSchemes.primaryColorScheme.onPrimary,
                  ),
                  const SizedBox(height: 7.0),
                  Text_Form_Field_Password(
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (p0) {
                      print('Password: $p0');
                    },
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    validator: Validator.passwordValidator,
                    fillColor: ColorSchemes.primaryColorScheme.outline,
                    hintText: 'Enter your password',
                    hintStyle: AppStyle.textFormField,
                  ),
                  const SizedBox(height: 53.0),
                  Text_Title(
                      text: 'Forgot Password ?',
                      style: AppStyle.textForgotPassword),
                  const SizedBox(height: 37.0),
                  Center(
                      child: Custom_button(
                          gradient: AppColor.linear,
                          width: 277.w,
                          height: 40.h,
                          style: AppStyle.button,
                          borderRadius: BorderRadius.circular(10.0),
                          text: 'Sign in',
                          onPressed: () {
                            authBloc.add(AuthSignInEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                          })),
                  const SizedBox(height: 37.0),
                  CustomText(
                    text1: 'Don\'t have an account?',
                    text2: ' Sign up',
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                          child: SignUp(
                            authBloc: BlocProvider.of<AuthBloc>(context),
                          ),
                        ),
                      );
                      print('Text pressed!');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
