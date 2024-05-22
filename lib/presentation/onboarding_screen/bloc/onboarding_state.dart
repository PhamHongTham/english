part of 'onboarding_bloc.dart';

class OnboardingStates extends Equatable {
  final int pageIndex;

  const OnboardingStates({this.pageIndex = 0});

  @override
  List<Object?> get props => [pageIndex];
}
