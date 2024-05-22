import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial());

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is LoadVideo) {
      yield* _mapLoadVideoToState(event);
    }
  }

  Stream<VideoState> _mapLoadVideoToState(LoadVideo event) async* {
    yield VideoLoading();
    try {
      final controller = VideoPlayerController.network(event.videoUrl);
      await controller.initialize();
      yield VideoLoaded(controller);
    } catch (e) {
      yield VideoError('Error loading video: $e');
    }
  }
}
