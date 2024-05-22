import 'package:english/components/button/custom_button.dart';
import 'package:english/components/custom_text/custom_text.dart';
import 'package:english/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:english/components/custom_text_form_field/custom_text_form_field_password.dart';
import 'package:english/components/icons_texts/icons_texts.dart';
import 'package:english/components/text_title/text_title.dart';
import 'package:english/presentation/auth/bloc/auth_bloc.dart';
import 'package:english/presentation/auth/signin.dart';
import 'package:english/them/them_helper.dart';
import 'package:english/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUp extends StatelessWidget {
  const CustomSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _fullNameController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final _formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Thông báo'),
                content: Text('Đăng ký thành công'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(authBloc: authBloc),
                        ),
                      );
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else if (state is AuthFailure) {
          // Show failure dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Đăng ký thất bại'),
                content: Text(state.error),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
        // Handle other states...
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
                    text: 'Create Account',
                    style: AppStyle.textWelcom,
                  ),
                  Text_Title(
                    text: 'Hello there, fill in below to create\nan account',
                    style: AppStyle.textInput,
                  ),
                  const SizedBox(height: 45.0),
                  IconText(
                    icon: Icons.person_4_outlined,
                    text: 'Full Name',
                    style: AppStyle.textEmail_Password,
                    color: ColorSchemes.primaryColorScheme.onPrimary,
                  ),
                  const SizedBox(height: 7.0),
                  Text_Form_Field(
                    controller: _fullNameController,
                    validator: Validator.nameValidator,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      print('Full Name: $value');
                    },
                    textInputAction: TextInputAction.next,
                    fillColor: ColorSchemes.primaryColorScheme.outline,
                    hintText: 'Enter your fullname',
                    hintStyle: AppStyle.textFormField,
                  ),
                  const SizedBox(height: 10.0),
                  IconText(
                    icon: Icons.phone_rounded,
                    text: 'Phone Number',
                    style: AppStyle.textEmail_Password,
                    color: ColorSchemes.primaryColorScheme.onPrimary,
                  ),
                  const SizedBox(height: 7.0),
                  Text_Form_Field(
                    controller: _phoneNumberController,
                    validator: Validator.phoneNumberValidator,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (value) {
                      print('Phone Number: $value');
                    },
                    textInputAction: TextInputAction.next,
                    // validator: Validator.emailValidator,
                    fillColor: ColorSchemes.primaryColorScheme.outline,
                    hintText: 'Enter your phone number',
                    hintStyle: AppStyle.textFormField,
                  ),
                  const SizedBox(height: 10.0),
                  IconText(
                    icon: Icons.email_outlined,
                    text: 'Email Address',
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
                    hintText: 'Enter your email',
                    hintStyle: AppStyle.textFormField,
                  ),
                  const SizedBox(height: 10.0),
                  IconText(
                    icon: Icons.lock_person_outlined,
                    text: 'Password',
                    style: AppStyle.textEmail_Password,
                    color: ColorSchemes.primaryColorScheme.onPrimary,
                  ),
                  const SizedBox(height: 7.0),
                  Text_Form_Field_Password(
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (password) {
                      print('Password: $password');
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
                    style: AppStyle.textForgotPassword,
                  ),
                  const SizedBox(height: 37.0),
                  Center(
                    child: Custom_button(
                      gradient: AppColor.linear,
                      width: 277.w,
                      height: 40.h,
                      style: AppStyle.button,
                      borderRadius: BorderRadius.circular(10.0),
                      text: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authBloc.add(AuthSignUpEvent(
                            _fullNameController.text,
                            _phoneNumberController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 37.0),
                  CustomText(
                    text1: 'Already have an account?',
                    text2: ' Sign In',
                    onTap: () {
                      print('Text pressed!');
                      // Chuyển đến màn hình đăng nhập (SignIn)
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => SignIn(authBloc: authBloc)),
                      );
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
