import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../home_screen/model/home_model.dart';

class VideoDetailScreen extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;

  const VideoDetailScreen({
    Key? key,
    required this.videoUrl,
    required this.videoTitle,
  }) : super(key: key);

  @override
  _VideoDetailScreenState createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late VideoPlayerController _controller;
  late bool _isPlaying;
  late bool _showPauseButton;
  late String _selectedVideoUrl; // Thêm biến để theo dõi URL video được chọn

  List<String> _otherVideoUrls = [
    // Các URL video khác ở đây
    "https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/video%2FH%E1%BB%8Dc%20Ti%E1%BA%BFng%20Anh%20Qua%20Nh%E1%BB%AFng%20%C4%90o%E1%BA%A1n%20Video%20Ng%E1%BA%AFn%20-%20Nh%E1%BB%AFng%20C%C3%A2u%20N%C3%B3i%20Hay%20-%20%232%20%5BEnglish%20For%20Life%5D.mp4?alt=media&token=d05f3e37-5e1f-4dbb-beb1-bee5c0ea619e"
  ];

  @override
  void initState() {
    super.initState();
    _isPlaying = false;
    _showPauseButton = false;
    _selectedVideoUrl = widget.videoUrl; // Khởi tạo URL video được chọn ban đầu
    _controller = VideoPlayerController.network(_selectedVideoUrl)
      ..initialize().then((_) {
        setState(() {
          _showPauseButton = true;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(_controller),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _togglePlayPause();
                    });
                  },
                  child: Visibility(
                    visible: !_isPlaying,
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                      child: const Icon(
                        Icons.play_arrow,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isPlaying && _showPauseButton,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _togglePlayPause();
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                      child: const Icon(
                        Icons.pause,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 12),
            child: Text(
              widget.videoTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 12),
              Text(
                'Category: ${HomeModel().category}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              const SizedBox(width: 5),
              const Text(
                ' 4.5',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildExpansionPanelList(),
        ],
      ),
    );
  }

  // Hàm cập nhật URL video được chọn và khởi tạo lại VideoPlayerController
  void _updateSelectedVideo(String url) {
    setState(() {
      _selectedVideoUrl = url;
    });
    _controller = VideoPlayerController.network(_selectedVideoUrl)
      ..initialize().then((_) {
        setState(() {
          _showPauseButton = true;
        });
      });
  }

  // Hàm xây dựng danh sách các video khác
  Widget _buildExpansionPanelList() {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          // Toggle the expansion state of the panel
          // Here, we're not expanding/collapsing any panel
        });
      },
      children: _otherVideoUrls.map<ExpansionPanel>((url) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return GestureDetector(
              onTap: () {
                _updateSelectedVideo(
                    url); // Gọi hàm để cập nhật video được chọn
              },
              child: const ListTile(
                title: Text('Video Title'), // Đặt tiêu đề video ở đây
              ),
            );
          },
          body: ListTile(
            title: Text('Video URL: $url'), // Hiển thị URL video ở đây
            onTap: () {
              _updateSelectedVideo(url); // Gọi hàm để cập nhật video được chọn
            },
          ),
          isExpanded: false, // Mặc định, các panel không được mở rộng
        );
      }).toList(),
    );
  }

  // Hàm chuyển đổi giữa trạng thái phát và tạm dừng
  void _togglePlayPause() {
    if (!_isPlaying) {
      _controller.play();
    } else {
      _controller.pause();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
