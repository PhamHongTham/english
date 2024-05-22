// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

// part 'home_event.dart';
// part 'home_state.dart';

// // BLoC
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitialState());

//   @override
//   Stream<HomeState> mapEventToState(HomeEvent event) async* {
//     if (event is InitializeHomeEvent) {
//       yield HomeLoadedState(event.fullName);
//     }
//   }
// }

// // Extension method để thêm sự kiện InitializeHomeEvent
// extension HomeBlocExtension on HomeBloc {
//   void onInitializeHome(String fullName) {
//     add(InitializeHomeEvent(fullName));
//   }
// }

// @override
// Stream<HomeState> mapEventToState(HomeEvent event) async* {
//   if (event is InitializeHomeEvent) {
//     yield HomeLoadedState(event.fullName);
//   } else if (event is LoadVideoEvent) {
//     yield HomeVideoLoadedState(event.videoUrl, event.title);
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:english/components/firebase/firebase.dart';
import 'package:english/presentation/home_screen/model/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  final FirebaseService firebaseService = FirebaseService();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is InitializeHomeEvent) {
      yield HomeLoadedState(event.fullName);
    } else if (event is FetchVideoEvent) {
      yield* _mapFetchVideoEventToState(event);
    }
  }

  Stream<HomeState> _mapFetchVideoEventToState(FetchVideoEvent event) async* {
    try {
      final videoUrl = await firebaseService.getVideoUrl(event.videoUrl);
      if (videoUrl != null) {
        yield HomeVideoLoadedState(videoUrl, 'Video Title');
      } else {
        yield HomeVideoLoadFailureState(); // Trạng thái khi không thể tải video
      }
    } catch (e) {
      yield HomeVideoLoadFailureState(); // Xử lý khi có lỗi xảy ra trong quá trình tải video
    }
  }

  // Extension method để thêm sự kiện InitializeHomeEvent
  void onInitializeHome(String fullName) {
    add(InitializeHomeEvent(fullName));
  }

  // Extension method để thêm sự kiện FetchVideoEvent
  void onFetchVideo(String videoUrl) {
    add(FetchVideoEvent(videoUrl));
  }

  Stream<HomeState> _mapSearchVideosEventToState(
      SearchVideosEvent event) async* {
    List<String> filteredVideoUrls = [];
    List<String> filteredVideoTitles = [];

    List<String> videoUrls = []; // Định nghĩa danh sách videoUrls

    for (int i = 0; i < videoUrls.length; i++) {
      // Sử dụng videoUrls thay vì event.videoUrls
      List<String> videoTitles = []; // Define the variable videoTitles

      if (videoTitles[i]
          .toLowerCase()
          .contains(event.searchTerm.toLowerCase())) {
        filteredVideoUrls
            .add(videoUrls[i]); // Sử dụng videoUrls thay vì event.videoUrls
        filteredVideoTitles.add(videoTitles[i]);
      }
    }

    yield SearchVideosState(filteredVideoUrls, filteredVideoTitles);
  }
}
