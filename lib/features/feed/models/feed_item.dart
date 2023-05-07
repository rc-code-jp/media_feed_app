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

  // タグを結合して文字列で返す
  String hashtagNames() {
    return tags.map((tag) => '#$tag').join(' ');
  }

  // ビデオが読み込まれているか
  bool hasVideoController() {
    return videoController != null;
  }

  // ビデオが再生しているか
  bool isPlayingVideo() {
    return videoController?.value.isPlaying == true;
  }

  // ビデオを読み込む
  Future<void> loadVideoController() async {
    videoController = VideoPlayerController.asset(url);
    await videoController?.initialize();
    videoController?.setLooping(true);
    videoController?.setVolume(1.0);
  }

  // ビデオを再生する
  void playVideo() {
    videoController?.play();
  }

  // ビデオを停止する
  void pauseVideo() {
    videoController?.pause();
  }

  // ビデオを最初から再スタート
  void playFromStart() {
    videoController?.seekTo(Duration.zero);
    videoController?.play();
  }

  // ビデオを破棄する
  void disposeVideo() {
    videoController?.dispose();
  }
}
