import 'package:english/components/button/button_update.dart';
import 'package:english/components/options/appBar/appBar.dart';
import 'package:english/components/payment/payment.dart';
import 'package:english/components/text_title/text_title.dart';
import 'package:english/gen/assets.gen.dart';
import 'package:english/presentation/payment/bloc/payment_bloc.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({
    Key? key,
    required UserBloc userBloc,
    required PaymentBloc paymentBloc,
  }) : super(key: key);

  @override
  State<AddNewCard> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<AddNewCard> {
  final TextEditingController cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const appBar(
                  icon: Icons.keyboard_backspace_sharp,
                  text: 'Add New Card',
                ),
                SizedBox(height: 50.h),
                Stack(
                  children: [
                    Container(
                      width: 360.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColor.sw2,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80, left: 26),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1234  5678  8765  0876',
                              style: AppStyle.card,
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Text(
                                  'Valid \nThru',
                                  style: AppStyle.card1,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '12/08',
                                  style: AppStyle.card2,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Timmy C. Hernandez',
                              style: AppStyle.card3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(Assets.images.cardpng.path),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(Assets.images.cardpng2.path),
                    ),
                    Positioned(
                      top: 27.h,
                      left: 28.w,
                      child: Transform.rotate(
                        angle: -9.43,
                        child: SvgPicture.asset(Assets.images.qr,
                            width: 22.0.w, height: 28.0.h),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text_Title(text: 'Card Name*', style: AppStyle.text),
                SizedBox(height: 10.h),
                CustomAddNewCard(
                    width: 360.w,
                    height: 50.h,
                    hintStyle: AppStyle.text,
                    hintText: 'Belinda C. Cullen'),
                SizedBox(height: 30.h),
                Text_Title(text: 'Card Number*', style: AppStyle.text),
                SizedBox(height: 10.h),
                CustomAddNewCard(
                    width: 360.w,
                    height: 50.h,
                    hintStyle: AppStyle.text,
                    hintText: '1234  5678  8765  0876'),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text_Title(text: 'Expiry Date*', style: AppStyle.text),
                    Text_Title(text: 'CVV*', style: AppStyle.text),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    CustomAddNewCard(
                        width: 170.w,
                        height: 50.h,
                        hintStyle: AppStyle.text,
                        hintText: '12/08'),
                    SizedBox(width: 20.w),
                    CustomAddNewCard(
                        width: 170.w,
                        height: 50.h,
                        hintStyle: AppStyle.text,
                        hintText: '123'),
                  ],
                ),
                SizedBox(height: 80.h),
                ButtonUpDate(
                    text: 'Add New Card',
                    onPressed: () {
                      () {
                        String cardNumber = cardNumberController.text;
                        context
                            .read<PaymentBloc>()
                            .add(AddCardEvent(cardNumber: cardNumber));
                      };
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
