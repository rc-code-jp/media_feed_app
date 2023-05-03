import 'package:video_player/video_player.dart';

class FeedItem {
  final String id;
  final String title;
  final String artistName;
  final String url;
  late List<String> tags;
  late bool isFinished; // 視聴済み
  late bool isAcquired; // 獲得済み
  late bool isFavorite; // いいね済み

  VideoPlayerController? videoController;

  FeedItem({
    required this.id,
    required this.title,
    required this.artistName,
    required this.url,
    this.tags = const [],
    this.isFinished = false,
    this.isAcquired = false,
    this.isFavorite = false,
    this.videoController,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      id: json['id'],
      title: json['title'],
      artistName: json['artistName'],
      tags: json['tags'],
      url: json['url'],
      isFinished: json['isFinished'],
      isAcquired: json['isAcquired'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artistName': artistName,
      'tags': tags,
      'url': url,
      'isFinished': isFinished,
      'isAcquired': isAcquired,
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
