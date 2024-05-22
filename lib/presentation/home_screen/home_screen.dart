// import 'package:english/components/custom_container/container_search.dart';
// import 'package:english/gen/assets.gen.dart';
// import 'package:english/presentation/home_screen/bloc/home_bloc.dart';
// import 'package:english/presentation/home_screen/model/home_model.dart';
// import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
// import 'package:english/presentation/user_screen.dart/user_screen.dart';
// import 'package:english/presentation/video_screen/bloc/video_bloc.dart';
// import 'package:english/presentation/video_screen/video_screen.dart';
// import 'package:english/them/them_helper.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:video_player/video_player.dart';

// class HomeScreen extends StatelessWidget {
//   final String fullName;
//   final String email;

//   const HomeScreen({
//     Key? key,
//     required this.fullName,
//     required this.email,
//     required HomeBloc homeBloc,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> videoUrls = [
//       "https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/video%2FH%E1%BB%8Dc%20Ti%E1%BA%BFng%20Anh%20Qua%20Nh%E1%BB%AFng%20%C4%90o%E1%BA%A1n%20Video%20Ng%E1%BA%AFn%20-%20Nh%E1%BB%AFng%20C%C3%A2u%20N%C3%B3i%20Hay%20-%20%231%20%5BEnglish%20For%20Life%5D.mp4?alt=media&token=0b390dd5-fdd7-4df9-9b6c-89eb4a702d0a",
//       "video2.mp4",
//       // Thêm các URL video khác vào đây nếu cần
//     ];

//     final List<String> videoTitle = [
//       "UX Design Course1",
//       "video2.mp4",
//       // Thêm các URL video khác vào đây nếu cần
//     ];

//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: AppColor.bgmain,
//       body: BlocProvider(
//         create: (context) => HomeBloc(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 31.0, horizontal: 23.0),
//           child: BlocBuilder<HomeBloc, HomeState>(
//             builder: (context, state) {
//               return ListView(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           _scaffoldKey.currentState!.openDrawer();
//                         },
//                         child: SvgPicture.asset(Assets.icons.layout),
//                       ),
//                       Transform(
//                         alignment: Alignment.center,
//                         transform: Matrix4.rotationY(10),
//                         child: Icon(
//                           Icons.waving_hand_rounded,
//                           color: Colors.yellow[700],
//                         ),
//                       ),
//                       Text(
//                         'Hello, $fullName!',
//                         style: AppStyle.textTitle,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => UserScreen(
//                                 userBloc: UserBloc(),
//                                 fullName: fullName,
//                                 email: email,
//                               ),
//                             ),
//                           );
//                         },
//                         child: const CircleAvatar(
//                           radius: 20,
//                           backgroundImage: NetworkImage(
//                             'https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/avt%2FScreenshot%202023-10-23%20204112.png?alt=media&token=5dd901aa-695a-4d8f-a99b-5eff27f4ac51',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 38.h),
//                   const ContainerSearch(
//                     text: 'Mulai\nBelajar',
//                   ),
//                   SizedBox(height: 20),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: homeData.map((model) {
//                         return GestureDetector(
//                           onTap: () {
//                             // BlocProvider.of<HomeBloc>(context).add(
//                             //   CategorySelectedEvent(model.category ?? ''),
//                             // );
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             padding: EdgeInsets.symmetric(
//                               vertical: 8,
//                               horizontal: 16,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.blue[100],
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: Text(
//                               model.category ?? '',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     shrinkWrap: true,
//                     itemCount: videoUrls.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           BlocProvider.of<HomeBloc>(context).add(
//                             FetchVideoEvent(videoUrls[index]),
//                           );
//                         },
//                         child: VideoWidget(
//                           videoUrl: videoUrls[index],
//                           videoTitle: videoTitle[index],
//                           category: homeData[index].category ?? '',
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english/components/custom_container/container_search.dart';
import 'package:english/gen/assets.gen.dart';
import 'package:english/presentation/home_screen/bloc/home_bloc.dart';
import 'package:english/presentation/home_screen/model/home_model.dart';
import 'package:english/presentation/user_screen.dart/bloc/bloc/user_bloc.dart';
import 'package:english/presentation/user_screen.dart/user_screen.dart';
import 'package:english/presentation/video_screen/bloc/video_bloc.dart';
import 'package:english/presentation/video_screen/video_screen.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  final String fullName;
  final String email;

  const HomeScreen({
    Key? key,
    required this.fullName,
    required this.email,
    required HomeBloc homeBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> videoUrls = [
      "https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/video%2FH%E1%BB%8Dc%20Ti%E1%BA%BFng%20Anh%20Qua%20Nh%E1%BB%AFng%20%C4%90o%E1%BA%A1n%20Video%20Ng%E1%BA%AFn%20-%20Nh%E1%BB%AFng%20C%C3%A2u%20N%C3%B3i%20Hay%20-%20%231%20%5BEnglish%20For%20Life%5D.mp4?alt=media&token=0b390dd5-fdd7-4df9-9b6c-89eb4a702d0a",
      "video2.mp4",
      // Thêm các URL video khác vào đây nếu cần
    ];

    final List<String> videoTitle = [
      "UX Design Course1",
      "video2.mp4",
      // Thêm các URL video khác vào đây nếu cần
    ];

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.bgmain,
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 31.0, horizontal: 23.0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: SvgPicture.asset(Assets.icons.layout),
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(10),
                        child: Icon(
                          Icons.waving_hand_rounded,
                          color: Colors.yellow[700],
                        ),
                      ),
                      Text(
                        'Hello, $fullName!',
                        style: AppStyle.textTitle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserScreen(
                                userBloc: UserBloc(),
                                fullName: fullName,
                                email: email,
                              ),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/avt%2FScreenshot%202023-10-23%20204112.png?alt=media&token=5dd901aa-695a-4d8f-a99b-5eff27f4ac51',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 38.h),
                  ContainerSearch(
                    text: 'Mulai\nBelajar',
                    onSearch: (searchTerm) {
                      BlocProvider.of<HomeBloc>(context).add(
                        SearchVideosEvent(searchTerm) as HomeEvent,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: homeData.map((model) {
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<HomeBloc>(context).add(
                            //   CategorySelectedEvent(model.category ?? ''),
                            // );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              model.category ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    itemCount: state is SearchVideosState
                        ? state.filteredVideoUrls.length
                        : videoUrls.length,
                    itemBuilder: (context, index) {
                      final List<String> urls = state is SearchVideosState
                          ? state.filteredVideoUrls
                          : videoUrls;
                      final List<String> titles = state is SearchVideosState
                          ? state.filteredVideoTitles
                          : videoTitle;
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<HomeBloc>(context).add(
                            FetchVideoEvent(urls[index]),
                          );
                        },
                        child: VideoWidget(
                          videoUrl: urls[index],
                          videoTitle: titles[index],
                          category: homeData[index].category ?? '',
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
