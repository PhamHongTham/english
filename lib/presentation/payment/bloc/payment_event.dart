part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class NavigateToPayment extends PaymentEvent {}

class AddCardEvent extends PaymentEvent {
  final String cardNumber;

  AddCardEvent({required this.cardNumber});
}
