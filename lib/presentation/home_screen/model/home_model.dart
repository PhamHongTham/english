import 'package:english/gen/assets.gen.dart';

class HomeModel {
  String? category;
  String? video;
  String? title;
  String? description;
}

List<HomeModel> homeData = [
  HomeModel()..category = 'Listening',
  HomeModel()..category = 'Speaking',
  HomeModel()..category = 'Reading',
  HomeModel()..category = 'Writing',
];
