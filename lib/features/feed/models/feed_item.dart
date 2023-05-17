import 'package:video_player/video_player.dart';

class FeedItem {
  final String id;
  final String title;
  final String artistName;
  final String url;
  late List<String> tags;
  late int progressSeconds; // 視聴済みまでの秒数
  late bool isFinished; // 視聴済み
  late bool isAcquired; // 獲得済み

  VideoPlayerController? videoController;

  FeedItem({
    required this.id,
    required this.title,
    required this.artistName,
    required this.url,
    this.tags = const [],
    this.progressSeconds = 15,
    this.isFinished = false,
    this.isAcquired = false,
    this.videoController,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      id: json['id'],
      title: json['title'],
      artistName: json['artistName'],
      url: json['url'],
      tags: json['tags'],
      progressSeconds: json['progressSeconds'],
      isFinished: json['isFinished'],
      isAcquired: json['isAcquired'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artistName': artistName,
      'url': url,
      'tags': tags,
      'progressSeconds': progressSeconds,
      'isFinished': isFinished,
      'isAcquired': isAcquired,
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
    videoController?.setLooping(true);
    videoController?.play();
  }

  // ビデオの音量を調整
  void setVideoVolume(double volume) {
    videoController?.setVolume(volume);
  }

  // ビデオを破棄する
  void disposeVideo() {
    videoController?.dispose();
  }
}
