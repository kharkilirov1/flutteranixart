import 'package:flutter/material.dart';
import '../../../models/anime.dart';
import '../../../widgets/anime_card.dart';
import '../../../constants/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  bool _isLoading = false;
  String _searchQuery = '';
  List<Anime> _searchResults = [];

  void _performSearch(String query) {
    setState(() {
      _isLoading = true;
      _searchQuery = query;
    });

    // TODO: Реализовать поиск через API
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _searchResults = [
            // Временные тестовые данные
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
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onSubmitted: _performSearch,
          decoration: const InputDecoration(
            hintText: 'Поиск аниме...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        actions: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchResults.clear();
                  _searchQuery = '';
                });
              },
            ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.pushNamed(context, '/filter');
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_searchQuery.isEmpty) {
      return const Center(
        child: Text(
          'Введите название аниме для поиска',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              'По запросу "$_searchQuery"\nничего не найдено',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ],
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
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        return AnimeCard(anime: _searchResults[index]);
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
