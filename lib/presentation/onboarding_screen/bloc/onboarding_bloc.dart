import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingStates> {
  OnboardingBloc() : super(const OnboardingStates()) {
    on<OnboardingEvents>(_pageIndex);
  }

  void _pageIndex(OnboardingEvents event, Emitter<OnboardingStates> emit) {
    final updatedPageIndex = event.pageIndex;
    print('Bloc-$updatedPageIndex');
    emit(OnboardingStates(pageIndex: updatedPageIndex));
  }
}
