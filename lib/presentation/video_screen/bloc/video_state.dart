part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object?> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final VideoPlayerController controller;

  const VideoLoaded(this.controller);

  @override
  List<Object?> get props => [controller];
}

class VideoError extends VideoState {
  final String message;

  const VideoError(this.message);

  @override
  List<Object?> get props => [message];
}

class VideoDetailNavigate extends VideoState {
  final String videoUrl;
  final String videoTitle;

  const VideoDetailNavigate(this.videoUrl, this.videoTitle);

  @override
  List<Object?> get props => [videoUrl, videoTitle];
}
