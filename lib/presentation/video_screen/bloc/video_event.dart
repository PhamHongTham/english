part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object?> get props => [];
}

class LoadVideo extends VideoEvent {
  final String videoUrl;

  const LoadVideo(this.videoUrl);

  @override
  List<Object?> get props => [videoUrl];
}

class NavigateToVideoDetail extends VideoEvent {
  final String videoUrl;
  final String videoTitle;

  const NavigateToVideoDetail(this.videoUrl, this.videoTitle);

  @override
  List<Object?> get props => [videoUrl, videoTitle];
}
