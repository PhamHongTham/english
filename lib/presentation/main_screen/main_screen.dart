// ignore_for_file: library_private_types_in_public_api

import 'package:english/components/button/custom_button_main.dart';
import 'package:english/components/dark/dark.dart';
import 'package:english/components/drawer/mydrawe.dart';
import 'package:english/presentation/course_screen/course_screen.dart';
import 'package:english/presentation/main_screen/bloc/mainscreen_bloc.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/presentation/user_screen.dart/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:english/gen/assets.gen.dart';
import 'package:english/presentation/home_screen/bloc/home_bloc.dart';
import 'package:english/presentation/home_screen/home_screen.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  final String fullName;
  final String email;

  const MainScreen({
    Key? key,
    required this.fullName,
    required MainBloc mainBloc,
    required this.email,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int current = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var darkModeProvider = context.watch<DarkModeProvider>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.bgmain,
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: [
          IndexedStack(
            index: current,
            children: [
              HomeScreen(
                fullName: widget.fullName,
                homeBloc: HomeBloc(),
                email: widget.email,
              ),
              const CourseScreen(),
              Container(
                color: AppColor.primaryColor,
              ),
              Container(
                color: AppColor.primaryColor,
              ),
              UserScreen(
                userBloc: UserBloc(),
                fullName: widget.fullName,
                email: widget.fullName,
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                width: 50.0,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(fullName: widget.fullName, email: widget.email),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 42.0, left: 28.0, right: 32.0),
        child: Container(
          width: 354.w,
          height: 89.h,
          decoration: BoxDecoration(
            color: ColorSchemes.primaryColorScheme.secondary,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarItems(
                onTap: () {
                  setState(() {
                    current = 0;
                  });
                },
                assetName: Assets.icons.home,
                color: current == 0 ? AppColor.signInSignUp : AppColor.search,
              ),
              BottomBarItems(
                onTap: () {
                  setState(() {
                    current = 1;
                  });
                },
                assetName: Assets.icons.university,
                color: current == 1 ? AppColor.signInSignUp : AppColor.search,
              ),
              BottomBarItems(
                onTap: () {
                  setState(() {
                    current = 2;
                  });
                },
                assetName: Assets.icons.thongbao,
                color: current == 2 ? AppColor.signInSignUp : AppColor.search,
              ),
              BottomBarItems(
                onTap: () {
                  setState(() {
                    current = 3;
                  });
                },
                assetName: Assets.icons.notification,
                color: current == 3 ? AppColor.signInSignUp : AppColor.search,
              ),
              BottomBarItems(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => UserScreen(
                            userBloc: UserBloc(),
                            fullName: widget.fullName,
                            email: widget.email)),
                  );
                },
                assetName: Assets.icons.user,
                color: current == 4 ? AppColor.signInSignUp : AppColor.search,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
