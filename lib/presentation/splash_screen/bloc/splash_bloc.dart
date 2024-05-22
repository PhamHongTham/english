import 'package:bloc/bloc.dart';
import 'package:english/services/local/shared_prefs.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>(_splashInitialEvent);
  }
  Future<void> _splashInitialEvent(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));
    if (SharedPrefs.isLoggedIn) {
      emit(Logged());
    } else {
      emit(NotLogged());
    }
  }
}
