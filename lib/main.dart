import 'package:english/components/dark/dark.dart';
import 'package:english/firebase_options.dart';
import 'package:english/presentation/auth/bloc/auth_bloc.dart';
import 'package:english/presentation/home_screen/bloc/home_bloc.dart';
import 'package:english/presentation/home_screen/home_screen.dart';
import 'package:english/presentation/main_screen/bloc/mainscreen_bloc.dart';
import 'package:english/presentation/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:english/presentation/payment/bloc/payment_bloc.dart';
import 'package:english/presentation/signin_signup/bloc/bloc/signin_signup_bloc.dart';

import 'package:english/presentation/splash_screen/bloc/splash_bloc.dart';
import 'package:english/presentation/splash_screen/splash_screen.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/presentation/video_screen/bloc/video_bloc.dart';
import 'package:english/services/local/shared_prefs.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initialise();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkModeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SplashBloc splashBloc = SplashBloc();
  final OnboardingBloc onboardingBloc = OnboardingBloc();
  final AuthBloc authBloc = AuthBloc();
  final SigninSignupBloc signinSignupBloc = SigninSignupBloc();
  final HomeBloc homeBloc = HomeBloc();
  final MainBloc mainBloc = MainBloc();
  final UserBloc userBloc = UserBloc();
  final PaymentBloc paymentBloc = PaymentBloc();
  final VideoBloc videoBloc = VideoBloc();

  MyApp() {
    splashBloc.add(SplashInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (context) => splashBloc),
        BlocProvider<OnboardingBloc>(create: (context) => onboardingBloc),
        BlocProvider<AuthBloc>(create: (context) => authBloc),
        BlocProvider<SigninSignupBloc>(create: (context) => signinSignupBloc),
        BlocProvider<HomeBloc>(create: (context) => homeBloc),
        BlocProvider<MainBloc>(create: (context) => mainBloc),
        BlocProvider<UserBloc>(create: (context) => userBloc),
        BlocProvider<PaymentBloc>(create: (context) => paymentBloc),
        BlocProvider<VideoBloc>(create: (context) => videoBloc),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
            return SplashScreen(
              splashBloc: SplashBloc(),
              fullName: '',
              email: '',
            );
          }),
        ),
      ),
    );
  }
}
