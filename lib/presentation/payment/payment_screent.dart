import 'package:english/components/button/button_update.dart';
import 'package:english/components/payment/buildConnectedState.dart';
import 'package:english/components/payment/buildNotConnectedState.dart';
import 'package:english/presentation/payment/add_new_card.dart';
import 'package:english/presentation/payment/bloc/payment_bloc.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
    required PaymentBloc paymentBloc,
    required UserBloc userBloc, // Use PaymentBloc instead of UserBloc
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: Column(
        children: [
          BlocBuilder<PaymentBloc, PaymentState>(
            // Use PaymentBloc instead of UserBloc
            builder: (context, state) {
              print('Current state: $state');
              if (state is PaymentConnected) {
                print(
                    'Connected state detected. Card Number: ${state.cardNumber}');
                return buildConnectedState(state);
              }
              print('Not connected state detected.');
              return buildNotConnectedState();
            },
          ),
          ButtonUpDate(
            text: 'Add New Card',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNewCard(
                        userBloc: UserBloc(), paymentBloc: PaymentBloc())),
              );
            },
          ),
        ],
      ),
    );
  }
}
