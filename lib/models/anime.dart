class Anime {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String status;
  final double rating;
  final List<String> genres;
  final int episodesCount;

  Anime({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.status,
    required this.rating,
    required this.genres,
    required this.episodesCount,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      status: json['status'],
      rating: json['rating'].toDouble(),
      genres: List<String>.from(json['genres']),
      episodesCount: json['episodesCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'status': status,
      'rating': rating,
      'genres': genres,
      'episodesCount': episodesCount,
    };
  }
}
