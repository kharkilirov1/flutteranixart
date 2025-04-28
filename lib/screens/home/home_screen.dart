import 'package:flutter/material.dart';
import '../../models/anime.dart';
import '../../widgets/anime_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  bool _isLoading = false;
  List<Anime> _animeList = [];

  @override
  void initState() {
    super.initState();
    _loadAnimeList();
  }

  Future<void> _loadAnimeList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Загрузка списка аниме из API
      // Временные тестовые данные
      _animeList = [
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
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка загрузки: $e')),
        );
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
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Поиск аниме...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadAnimeList,
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _animeList.length,
                itemBuilder: (context, index) {
                  return AnimeCard(anime: _animeList[index]);
                },
              ),
            ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
