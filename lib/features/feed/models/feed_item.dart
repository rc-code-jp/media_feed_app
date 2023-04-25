class FeedItem {
  final String id;
  final String title;
  final String url;

  FeedItem({required this.id, required this.title, required this.url});

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      id: json['id'],
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
    };
  }
}
