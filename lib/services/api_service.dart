import 'package:dio/dio.dart';
import '../models/anime.dart';
import '../models/episode.dart';
import '../models/comment.dart';

class ApiService {
  static const String _baseUrl =
      'https://api.anixart.com/v1'; // TODO: Заменить на реальный URL
  final Dio _dio;

  // Синглтон
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  ApiService._internal()
      : _dio = Dio(BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ));

  // Методы для работы с аниме
  Future<List<Anime>> getAnimeList({
    int page = 1,
    String? query,
    List<String>? genres,
    String? status,
    double? minRating,
    String? sortBy,
  }) async {
    try {
      final response = await _dio.get('/anime', queryParameters: {
        'page': page,
        if (query != null) 'query': query,
        if (genres != null) 'genres': genres.join(','),
        if (status != null) 'status': status,
        if (minRating != null) 'minRating': minRating,
        if (sortBy != null) 'sortBy': sortBy,
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Anime.fromJson(json)).toList();
      }
      throw Exception('Ошибка загрузки данных');
    } catch (e) {
      throw Exception('Ошибка сети: $e');
    }
  }

  Future<List<Episode>> getAnimeEpisodes(int animeId) async {
    try {
      final response = await _dio.get('/anime/$animeId/episodes');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Episode.fromJson(json)).toList();
      }
      throw Exception('Ошибка загрузки эпизодов');
    } catch (e) {
      throw Exception('Ошибка сети: $e');
    }
  }

  Future<List<Comment>> getAnimeComments(int animeId) async {
    try {
      final response = await _dio.get('/anime/$animeId/comments');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Comment.fromJson(json)).toList();
      }
      throw Exception('Ошибка загрузки комментариев');
    } catch (e) {
      throw Exception('Ошибка сети: $e');
    }
  }

  // Методы для работы с избранным
  Future<void> addToFavorites(int animeId) async {
    try {
      await _dio.post('/favorites/add/$animeId');
    } catch (e) {
      throw Exception('Ошибка при добавлении в избранное: $e');
    }
  }

  Future<void> removeFromFavorites(int animeId) async {
    try {
      await _dio.delete('/favorites/remove/$animeId');
    } catch (e) {
      throw Exception('Ошибка при удалении из избранного: $e');
    }
  }

  // Методы для работы с комментариями
  Future<void> addComment(int animeId, String text) async {
    try {
      await _dio.post('/comments/add', data: {
        'animeId': animeId,
        'text': text,
      });
    } catch (e) {
      throw Exception('Ошибка при добавлении комментария: $e');
    }
  }

  Future<void> likeComment(int commentId) async {
    try {
      await _dio.post('/comments/like/$commentId');
    } catch (e) {
      throw Exception('Ошибка при добавлении лайка: $e');
    }
  }

  // Интерцептор для добавления токена аутентификации
  void setAuthToken(String token) {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
  }
}
