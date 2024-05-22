import 'package:english/components/dark/dark.dart';
import 'package:english/gen/assets.gen.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatefulWidget {
  final String fullName;
  final String email;

  const MyDrawer({Key? key, required this.fullName, required this.email})
      : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var darkModeProvider = context.watch<DarkModeProvider>();

    return Drawer(
      backgroundColor:
          darkModeProvider.isDarkMode ? Colors.black : Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.fullName),
            accountEmail: Text(widget.email),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/avt%2FScreenshot%202023-10-23%20204112.png?alt=media&token=5dd901aa-695a-4d8f-a99b-5eff27f4ac51',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Học từ vựng'),
            onTap: () {
              // Handle vocabulary tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard_sharp),
            title: const Text('Nâng cấp'),
            onTap: () {
              // Handle upgrade tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings tap
              Navigator.pop(context);
            },
          ),
          const Divider(
            color: AppColor.divider,
            thickness: 1.3,
            endIndent: 24.0,
            indent: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.light),
              SizedBox(width: 6.0.w),
              const Text('Colour Scheme',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: AppColor.colourscheme)),
            ],
          ),
          SizedBox(height: 20.0.h),
          Container(
            width: 262.w,
            height: 40.h,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: AppColor.bg,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      darkModeProvider.toggleDarkMode();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: darkModeProvider.isDarkMode
                            ? Colors.transparent
                            : ColorSchemes.primaryColorScheme.secondary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.filled),
                          SizedBox(width: 9.51.w),
                          const Text('Light',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.colourscheme)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      darkModeProvider.toggleDarkMode();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: darkModeProvider.isDarkMode
                            ? ColorSchemes.primaryColorScheme.secondary
                            : Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.subtract),
                          SizedBox(width: 9.51.w),
                          const Text('Dark',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.colourscheme)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
