import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentNotConnected()) {
    on<PaymentEvent>((event, emit) {
      if (event is NavigateToPayment) {
        emit(PaymentNotConnected());
      }
    });

    on<AddCardEvent>((event, emit) {
      if (event is AddCardEvent) {
        emit(PaymentConnected(cardNumber: event.cardNumber));
      }
    });
  }
}
