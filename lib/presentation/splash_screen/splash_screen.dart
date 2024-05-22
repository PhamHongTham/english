import 'package:english/gen/assets.gen.dart';
import 'package:english/presentation/main_screen/bloc/mainscreen_bloc.dart';
import 'package:english/presentation/main_screen/main_screen.dart';
import 'package:english/presentation/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:english/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:english/presentation/splash_screen/bloc/splash_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  final String fullName;
  final String email;
  final SplashBloc splashBloc;

  const SplashScreen({
    Key? key,
    required this.splashBloc,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    widget.splashBloc.add(SplashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is Logged) {
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rotate,
                alignment: Alignment.bottomRight,
                duration: const Duration(seconds: 1),
                child: MainScreen(
                  mainBloc: BlocProvider.of<MainBloc>(context),
                  fullName: widget.fullName,
                  email: widget.email,
                ),
              ));
        }
        if (state is NotLogged) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rotate,
              alignment: Alignment.bottomRight,
              duration: const Duration(seconds: 1),
              child: OnboardingScreen(
                onboardingBloc: BlocProvider.of<OnboardingBloc>(context),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorSchemes.primaryColorScheme.background,
        body: Center(
          child: SvgPicture.asset(Assets.icons.logo),
        ),
      ),
    );
  }
}
