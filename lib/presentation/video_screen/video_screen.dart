// import 'package:english/presentation/video_screen/video_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoWidget extends StatefulWidget {
//   final String videoUrl;
//   final String videoTitle;

//   const VideoWidget({
//     Key? key,
//     required this.videoUrl,
//     required this.videoTitle,
//   }) : super(key: key);

//   @override
//   _VideoWidgetState createState() => _VideoWidgetState();
// }

// class _VideoWidgetState extends State<VideoWidget> {
//   late VideoPlayerController _controller;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadVideo();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _loadVideo() async {
//     try {
//       _controller = VideoPlayerController.network(widget.videoUrl);
//       await _controller.initialize();
//       setState(() {
//         _isInitialized = true;
//       });
//     } catch (e) {
//       print('Error loading video: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => VideoDetailScreen(
//               videoUrl: widget.videoUrl,
//               videoTitle: widget.videoTitle,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.blue[100],
//           borderRadius: BorderRadius.circular(16), // Set border radius here
//         ),
//         child: _isInitialized
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AspectRatio(
//                     aspectRatio: 16 / 9.5,
//                     child: Center(
//                       child: ClipRRect(
//                         borderRadius:
//                             BorderRadius.circular(20), // Set border radius here
//                         child: FittedBox(
//                           fit: BoxFit.contain,
//                           child: SizedBox(
//                             width: 2000,
//                             height: _controller.value.size.height,
//                             child: VideoPlayer(_controller),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 10), // 10px spacing below video
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10), // 10px padding on left and right
//                     child: Text(
//                       widget.videoTitle,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             : const Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//     );
//   }
// }
import 'package:english/presentation/video_screen/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;
  final String category; // Thêm tham số category vào VideoWidget

  const VideoWidget({
    Key? key,
    required this.videoUrl,
    required this.videoTitle,
    required this.category,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadVideo() async {
    try {
      _controller = VideoPlayerController.network(widget.videoUrl);
      await _controller.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Error loading video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoDetailScreen(
              videoUrl: widget.videoUrl,
              videoTitle: widget.videoTitle,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: _isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9.5,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                            width: 2000,
                            height: _controller.value.size.height,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.videoTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
