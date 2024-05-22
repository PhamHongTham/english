part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitializeHomeEvent extends HomeEvent {
  final String fullName;

  const InitializeHomeEvent(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class FetchVideoEvent extends HomeEvent {
  final String videoUrl;

  const FetchVideoEvent(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}

class SearchVideosEvent extends Equatable {
  final String searchTerm;

  const SearchVideosEvent(this.searchTerm);

  @override
  List<Object?> get props => [searchTerm];
}
