import 'package:english/components/custom_container/custom_signup.dart';
import 'package:english/components/text_title/text_title.dart';
import 'package:english/presentation/auth/bloc/auth_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required AuthBloc authBloc}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, top: 21.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.keyboard_backspace_sharp,
                      size: 45.0,
                      color: ColorSchemes.primaryColorScheme.secondary,
                    ),
                  ),
                ),
                Center(
                  child: Text_Title(
                    text: 'Learn English',
                    style: AppStyle.textTitle,
                  ),
                ),
                const SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text_Title(
                    text: 'Sign Up',
                    style: AppStyle.textSubtitle,
                  ),
                ),
                const SizedBox(height: 42.0),
                SlideTransition(
                  position: _offsetAnimation,
                  child: CustomSignUp(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
