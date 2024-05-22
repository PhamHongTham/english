import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mainscreen_event.dart';
part 'mainscreen_state.dart';

class MainBloc extends Bloc<MainscreenEvent, MainState> {
  MainBloc() : super(MainInitialState());

  void setCurrentIndex(int index) {
    emit(MainIndexChangedState(index: index));
  }
}
