import 'package:flutter/material.dart';
import 'screens/auth/auth_screen.dart';
import 'screens/main/tabs_screen.dart';
import 'screens/main/search/search_screen.dart';
import 'screens/main/notifications/notifications_screen.dart';
import 'screens/main/anime/anime_details_screen.dart';
import 'screens/update/update_screen.dart';
import 'screens/main/episodes/episodes_screen.dart';
import 'screens/main/filter/filter_screen.dart';
import 'screens/auth/sign_up_form.dart';
import 'screens/home/home_screen.dart';
import 'screens/player/video_player_screen.dart';
import 'models/anime.dart';
import 'models/episode.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String main = '/main';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String update = '/update';
  static const String episodes = '/episodes';
  static const String filter = '/filter';
  static const String animeDetails = '/anime/details';
  static const String home = '/';
  static const String signUp = '/signup';
  static const String videoPlayer = '/video-player';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case animeDetails:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => AnimeDetailsScreen(
            animeId: args['animeId'] as String,
          ),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpForm());
      case videoPlayer:
        final episode = settings.arguments as Episode;
        return MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(episode: episode),
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Маршрут ${settings.name} не найден'),
            ),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> get routes => {
        auth: (context) => const AuthScreen(),
        main: (context) => const TabsScreen(),
        search: (context) => const SearchScreen(),
        notifications: (context) => const NotificationsScreen(),
        filter: (context) => const FilterScreen(),
        episodes: (context) => const EpisodesScreen(
              title: 'Название аниме',
              totalEpisodes: 12,
            ),
        update: (context) => const UpdateScreen(
              currentVersion: '1.0.0',
              newVersion: '1.1.0',
              changelog: 'Исправлены ошибки и улучшена производительность',
            ),
      };
}
