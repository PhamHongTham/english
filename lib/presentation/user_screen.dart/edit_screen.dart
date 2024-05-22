// import 'package:english/components/button/button_update.dart';
// import 'package:english/components/button/custom_button.dart';
// import 'package:english/components/custom_text_form_field/custom_text_form_field.dart';
// import 'package:english/components/options/appBar/appBar.dart';
// import 'package:english/components/options/buildProfileImages/buildProfileImages.dart';
// import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
// import 'package:english/them/them_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class EditScreen extends StatefulWidget {
//   final String fullName;
//   final String email;

//   const EditScreen({
//     Key? key,
//     required UserBloc userBloc,
//     required this.fullName,
//     required this.email,
//   }) : super(key: key);

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   late TextEditingController birthdayController;

//   @override
//   void initState() {
//     super.initState();
//     birthdayController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     birthdayController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bloc = BlocProvider.of<UserBloc>(context);
//     return Scaffold(
//       backgroundColor: ColorSchemes.primaryColorScheme.background,
//       body: BlocBuilder<UserBloc, UserState>(
//         builder: (context, state) {
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const appBar(
//                     icon: Icons.keyboard_backspace_sharp,
//                     text: 'Edit Profile',
//                   ),
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 60.h),
//                       width: 360.w,
//                       height: 720.h,
//                       decoration: BoxDecoration(
//                         color: ColorSchemes.primaryColorScheme.secondary,
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                       child: ListView(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 85.0, horizontal: 30.0),
//                         children: [
//                           Text(widget.fullName,
//                               style: AppStyle.title1,
//                               textAlign: TextAlign.center),
//                           SizedBox(width: 14.w),
//                           Text(widget.email,
//                               style: AppStyle.title1,
//                               textAlign: TextAlign.center),
//                           SizedBox(height: 10.h),
//                           Text_Form_Field(
//                             keyboardType: TextInputType.name,
//                             textInputAction: TextInputAction.next,
//                             fillColor: AppColor.bgColor,
//                             prefixIcon: const Icon(
//                               Icons.person_2_outlined,
//                               color: AppColor.colourscheme,
//                             ),
//                             hintText: 'Fullname',
//                             hintStyle: AppStyle.textFormField,
//                           ),
//                           const SizedBox(height: 30.0),
//                           GestureDetector(
//                             onTap: () async {
//                               // Show date picker
//                               DateTime? selectedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime(1900),
//                                 lastDate: DateTime.now(),
//                               );

//                               if (selectedDate != null) {
//                                 bloc.add(ChooseDateOfBirthEvent(
//                                     dateOfBirth: selectedDate));
//                                 // Handle the selected date
//                                 // print("Selected date: $selectedDate");
//                                 // setState(() {
//                                 //   birthdayController.text = selectedDate
//                                 //       .toLocal()
//                                 //       .toString()
//                                 //       .split(' ')[0];
//                                 // });
//                               }
//                             },
//                             child: AbsorbPointer(
//                               child: Text_Form_Field(
//                                 controller: bloc.birthdayController,
//                                 readOnly: true,
//                                 keyboardType: TextInputType.datetime,
//                                 fillColor: AppColor.bgColor,
//                                 hintText: 'Date of birthday',
//                                 prefixIcon: const Icon(
//                                   Icons.calendar_month_outlined,
//                                   color: AppColor.colourscheme,
//                                 ),
//                                 hintStyle: AppStyle.textFormField,
//                               ),
//                             ),
//                           ),
//                           // buildDateTextField(context),
//                           const SizedBox(height: 30.0),
//                           Text_Form_Field(
//                             keyboardType: TextInputType.emailAddress,
//                             textInputAction: TextInputAction.next,
//                             fillColor: AppColor.bgColor,
//                             hintText: 'Email',
//                             prefixIcon: const Icon(
//                               Icons.email_outlined,
//                               color: AppColor.colourscheme,
//                             ),
//                             hintStyle: AppStyle.textFormField,
//                           ),
//                           const SizedBox(height: 30.0),
//                           Text_Form_Field(
//                             keyboardType: TextInputType.phone,
//                             textInputAction: TextInputAction.next,
//                             fillColor: AppColor.bgColor,
//                             hintText: 'Phone number',
//                             prefixIcon: const Icon(
//                               Icons.contact_phone_outlined,
//                               color: AppColor.colourscheme,
//                             ),
//                             hintStyle: AppStyle.textFormField,
//                           ),
//                           const SizedBox(height: 30.0),
//                           Text_Form_Field(
//                             keyboardType: TextInputType.text,
//                             textInputAction: TextInputAction.next,
//                             fillColor: AppColor.bgColor,
//                             hintText: 'Gender',
//                             prefixIcon: const Icon(
//                               Icons.person_outline_outlined,
//                               color: AppColor.colourscheme,
//                             ),
//                             suffixIcon: const Icon(
//                               Icons.arrow_drop_down,
//                               color: AppColor.colourscheme,
//                             ),
//                             hintStyle: AppStyle.textFormField,
//                           ),
//                           const SizedBox(height: 30.0),
//                           ButtonUpDate(
//                               widget: widget,
//                               text: 'Update',
//                               onPressed: () {
//                                 () {
//                                   // Dispatch the event to update the user profile
//                                   context.read<UserBloc>().add(
//                                         UpdateUserProfileEvent(
//                                           fullName: widget.fullName,
//                                           email: widget.email,
//                                         ),
//                                       );
//                                 };
//                               }),
//                         ],
//                       ),
//                     ),
//                     buildProfileImages(
//                       width: 36.0.w,
//                       height: 36.0.h,
//                       left: 125.w,
//                       right: 125.w,
//                       bottom: 640.h,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Widget buildDateTextField(BuildContext context) {
//   //   return
//   // }
// }
import 'package:english/components/button/button_update.dart';
import 'package:english/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:english/components/options/appBar/appBar.dart';
import 'package:english/components/options/buildProfileImages/buildProfileImages.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditScreen extends StatefulWidget {
  final String fullName;
  final String email;

  const EditScreen({
    Key? key,
    required UserBloc userBloc,
    required this.fullName,
    required this.email,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController birthdayController;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    birthdayController = TextEditingController();
    fullNameController = TextEditingController(text: widget.fullName);
    emailController = TextEditingController(text: widget.email);
    phoneNumberController = TextEditingController();
    genderController = TextEditingController();
  }

  @override
  void dispose() {
    birthdayController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      backgroundColor: ColorSchemes.primaryColorScheme.background,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const appBar(
                    icon: Icons.keyboard_backspace_sharp,
                    text: 'Edit Profile',
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      width: 360.w,
                      height: 720.h,
                      decoration: BoxDecoration(
                        color: ColorSchemes.primaryColorScheme.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 85.0, horizontal: 30.0),
                        children: [
                          Text(widget.fullName,
                              style: AppStyle.title1,
                              textAlign: TextAlign.center),
                          SizedBox(width: 14.w),
                          Text(widget.email,
                              style: AppStyle.title1,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10.h),
                          Text_Form_Field(
                            controller: fullNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            fillColor: AppColor.bgColor,
                            prefixIcon: const Icon(
                              Icons.person_2_outlined,
                              color: AppColor.colourscheme,
                            ),
                            hintText: 'Fullname',
                            hintStyle: AppStyle.textFormField,
                          ),
                          const SizedBox(height: 30.0),
                          GestureDetector(
                            onTap: () async {
                              // Show date picker
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              if (selectedDate != null) {
                                bloc.add(ChooseDateOfBirthEvent(
                                    dateOfBirth: selectedDate));
                              }
                            },
                            child: AbsorbPointer(
                              child: Text_Form_Field(
                                controller: birthdayController,
                                readOnly: true,
                                keyboardType: TextInputType.datetime,
                                fillColor: AppColor.bgColor,
                                hintText: 'Date of birthday',
                                prefixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: AppColor.colourscheme,
                                ),
                                hintStyle: AppStyle.textFormField,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Text_Form_Field(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            fillColor: AppColor.bgColor,
                            hintText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppColor.colourscheme,
                            ),
                            hintStyle: AppStyle.textFormField,
                          ),
                          const SizedBox(height: 30.0),
                          Text_Form_Field(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            fillColor: AppColor.bgColor,
                            hintText: 'Phone number',
                            prefixIcon: const Icon(
                              Icons.contact_phone_outlined,
                              color: AppColor.colourscheme,
                            ),
                            hintStyle: AppStyle.textFormField,
                          ),
                          const SizedBox(height: 30.0),
                          Text_Form_Field(
                            controller: genderController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            fillColor: AppColor.bgColor,
                            hintText: 'Gender',
                            prefixIcon: const Icon(
                              Icons.person_outline_outlined,
                              color: AppColor.colourscheme,
                            ),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: AppColor.colourscheme,
                            ),
                            hintStyle: AppStyle.textFormField,
                          ),
                          const SizedBox(height: 30.0),
                          ButtonUpDate(
                            widget: widget,
                            text: 'Update',
                            onPressed: () {
                              // Dispatch the event to update the user profile
                              bloc.add(
                                UpdateUserProfileEvent(
                                  fullName: fullNameController.text,
                                  email: emailController.text,
                                  // You need to handle other fields here like birthday, phone number, gender
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    buildProfileImages(
                      width: 36.0.w,
                      height: 36.0.h,
                      left: 125.w,
                      right: 125.w,
                      bottom: 640.h,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
