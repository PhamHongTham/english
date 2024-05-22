import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> getVideoUrl(String videoPath) async {
    try {
      final ref = _storage.ref().child(videoPath);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error getting video URL: $e');
      return null;
    }
  }

  getVideoUrlsForCategory(String category) {}
}
