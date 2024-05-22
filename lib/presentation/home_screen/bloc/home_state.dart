part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadedState extends HomeState {
  final String fullName;

  const HomeLoadedState(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class HomeVideoLoadedState extends HomeState {
  final String videoUrl;
  final String title;

  const HomeVideoLoadedState(this.videoUrl, this.title);

  @override
  List<Object> get props => [videoUrl, title];
}

class HomeVideoLoadFailureState extends HomeState {
  @override
  List<Object> get props => [];
}

class SearchVideosState extends HomeState {
  final List<String> filteredVideoUrls;
  final List<String> filteredVideoTitles;

  const SearchVideosState(this.filteredVideoUrls, this.filteredVideoTitles);

  @override
  List<Object> get props => [filteredVideoUrls, filteredVideoTitles];
}
