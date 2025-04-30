class MediaItem {
  final String title;
  final String imageUrl;

  MediaItem({required this.title, required this.imageUrl});

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      title: json['title']['rendered'],
      imageUrl: json['guid']['rendered'],
    );
  }
}
