class Episode {
  final int id;
  final int animeId;
  final int number;
  final String title;
  final String videoUrl;
  final String previewImageUrl;
  final Duration duration;
  final bool isWatched;

  Episode({
    required this.id,
    required this.animeId,
    required this.number,
    required this.title,
    required this.videoUrl,
    required this.previewImageUrl,
    required this.duration,
    this.isWatched = false,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      animeId: json['animeId'],
      number: json['number'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      previewImageUrl: json['previewImageUrl'],
      duration: Duration(seconds: json['durationInSeconds']),
      isWatched: json['isWatched'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'animeId': animeId,
      'number': number,
      'title': title,
      'videoUrl': videoUrl,
      'previewImageUrl': previewImageUrl,
      'durationInSeconds': duration.inSeconds,
      'isWatched': isWatched,
    };
  }
}
