class User {
  final int id;
  final String username;
  final String email;
  final String? avatarUrl;
  final List<int> favoriteAnimeIds;
  final List<int> watchedAnimeIds;
  final Map<int, int> watchProgress; // animeId -> lastWatchedEpisode

  User({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    this.favoriteAnimeIds = const [],
    this.watchedAnimeIds = const [],
    this.watchProgress = const {},
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      favoriteAnimeIds: List<int>.from(json['favoriteAnimeIds'] ?? []),
      watchedAnimeIds: List<int>.from(json['watchedAnimeIds'] ?? []),
      watchProgress: Map<int, int>.from(json['watchProgress'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'avatarUrl': avatarUrl,
      'favoriteAnimeIds': favoriteAnimeIds,
      'watchedAnimeIds': watchedAnimeIds,
      'watchProgress': watchProgress,
    };
  }
}
