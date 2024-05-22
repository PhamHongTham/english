part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {
  const PaymentState();
}

class PaymentInitial extends PaymentState {}

class PaymentConnected extends PaymentState {
  final String cardNumber;

  const PaymentConnected({required this.cardNumber});
}

class PaymentNotConnected extends PaymentState {}
