import 'package:english/components/button/custom_button.dart';
import 'package:english/presentation/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:english/presentation/onboarding_screen/model/onboarding_model.dart';
import 'package:english/presentation/signin_signup/bloc/bloc/signin_signup_bloc.dart';
import 'package:english/presentation/signin_signup/bloc/signin_signup.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingBloc onboardingBloc;

  const OnboardingScreen({
    Key? key,
    required this.onboardingBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocBuilder<OnboardingBloc, OnboardingStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: onboardingData.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      onboardingBloc.add(OnboardingEvents(pageIndex: index));
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(onboardingData[state.pageIndex].logo!,
                              style: AppStyle.titleOnboarding),
                          SizedBox(
                            height: 227.h,
                          ),
                          Text(onboardingData[state.pageIndex].title!,
                              style: AppStyle.subtitle),
                          SizedBox(
                            height: 28.h,
                          ),
                          Text(
                            onboardingData[state.pageIndex].description!,
                            textAlign: TextAlign.center,
                            style: AppStyle.description,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                    spacing: 5,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Custom_button(
                    gradient: AppColor.linearBT,
                    onPressed: () {
                      if (state.pageIndex == 2) {
                        Navigator.of(context).push(PageTransition(
                          type: PageTransitionType
                              .rightToLeft, // Chọn loại hiệu ứng chuyển trang
                          duration: const Duration(milliseconds: 700),
                          child: SignInSignUpScreen(
                            signinSignupBloc:
                                BlocProvider.of<SigninSignupBloc>(context),
                          ),
                        ));

                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => SignInSignUpScreen(
                        //     signinSignupBloc:
                        //         BlocProvider.of<SigninSignupBloc>(context),
                        //   ),
                        // ));
                      }
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    text: 'Selanjutnya',
                    style: AppStyle.button,
                    borderRadius: BorderRadius.circular(10.0),
                    width: 197.w,
                    height: 45.h,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
