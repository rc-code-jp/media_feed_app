import 'package:video_player/video_player.dart';

class FeedItem {
  final String id;
  final String title;
  final String artistName;
  final String url;
  late bool isCompleted;
  late bool isFavorite;

  VideoPlayerController? videoController;

  FeedItem({
    required this.id,
    required this.title,
    required this.artistName,
    required this.url,
    this.isCompleted = false,
    this.isFavorite = false,
    this.videoController,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      id: json['id'],
      title: json['title'],
      artistName: json['artistName'],
      url: json['url'],
      isCompleted: json['isCompleted'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artistName': artistName,
      'url': url,
      'isCompleted': isCompleted,
      'isFavorite': isFavorite,
    };
  }

  // ビデオを読み込む
  Future<void> loadVideoController() async {
    videoController = VideoPlayerController.asset(url);
    await videoController?.initialize();
    videoController?.setLooping(true);
  }
}
