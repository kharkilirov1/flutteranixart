import 'package:flutter/material.dart';
import '../../../models/user.dart';
import '../../../models/anime.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/anime_card.dart';
import '../../../constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  User? _user;
  bool _isLoading = true;
  List<Anime> _favoriteAnime = [];
  List<Anime> _watchHistory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = await AuthService().getCurrentUser();
      if (user != null) {
        setState(() {
          _user = user;
          // TODO: Загрузить избранное и историю просмотров из API
          _favoriteAnime = [
            Anime(
              id: 1,
              title: 'Наруто',
              description: 'История о ниндзя',
              imageUrl: 'https://example.com/naruto.jpg',
              status: 'Завершен',
              rating: 4.8,
              genres: ['Боевик', 'Приключения'],
              episodesCount: 720,
            ),
          ];
          _watchHistory = [
            Anime(
              id: 2,
              title: 'Блич',
              description: 'История о проводнике душ',
              imageUrl: 'https://example.com/bleach.jpg',
              status: 'Завершен',
              rating: 4.7,
              genres: ['Боевик', 'Сверхъестественное'],
              episodesCount: 366,
            ),
          ];
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_user == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Войдите, чтобы увидеть свой профиль',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/auth');
                },
                child: const Text('Войти'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.primary, AppColors.surface],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: _user?.avatarUrl != null
                              ? NetworkImage(_user!.avatarUrl!)
                              : null,
                          child: _user?.avatarUrl == null
                              ? const Icon(Icons.person, size: 40)
                              : null,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _user?.username ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          _user?.email ?? '',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Избранное'),
                  Tab(text: 'История'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildAnimeGrid(_favoriteAnime),
            _buildAnimeGrid(_watchHistory),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimeGrid(List<Anime> animeList) {
    if (animeList.isEmpty) {
      return const Center(
        child: Text(
          'Список пуст',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: animeList.length,
      itemBuilder: (context, index) {
        return AnimeCard(anime: animeList[index]);
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
