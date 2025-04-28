import 'package:flutter/material.dart';
import '../../../widgets/anime_card.dart';
import '../../../models/anime.dart';
import '../tab_fragment.dart';

class DiscoverScreen extends TabFragment {
  const DiscoverScreen({super.key}) : super(title: 'Обзор');

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends TabFragmentState<DiscoverScreen> {
  List<Anime> _recommendations = [];
  List<Anime> _newReleases = [];
  List<Anime> _popular = [];

  @override
  Future<void> loadData() async {
    setLoading(true);
    try {
      // TODO: Загрузить данные из API
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _recommendations = List.generate(
          10,
          (index) => Anime(
            id: 'rec_$index',
            title: 'Рекомендация $index',
            rating: 4.5 + (index / 10),
            status: 'Онгоинг',
            genres: ['Боевик', 'Фэнтези'],
            type: 'TV',
            episodesCount: 12,
            year: 2024,
          ),
        );

        _newReleases = List.generate(
          10,
          (index) => Anime(
            id: 'new_$index',
            title: 'Новинка $index',
            rating: 4.0 + (index / 10),
            status: 'Онгоинг',
            genres: ['Приключения', 'Комедия'],
            type: 'TV',
            episodesCount: 12,
            year: 2024,
          ),
        );

        _popular = List.generate(
          10,
          (index) => Anime(
            id: 'pop_$index',
            title: 'Популярное $index',
            rating: 4.8 - (index / 10),
            status: 'Завершено',
            genres: ['Драма', 'Романтика'],
            type: 'TV',
            episodesCount: 12,
            year: 2024,
          ),
        );
      });

      setLoading(false);
    } catch (e) {
      setError(e.toString());
    }
  }

  Widget _buildHorizontalList({
    required String title,
    required List<Anime> items,
    VoidCallback? onShowAll,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (onShowAll != null)
                TextButton(
                  onPressed: onShowAll,
                  child: const Text('Все'),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final anime = items[index];
              return SizedBox(
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: AnimeCard(
                    title: anime.title,
                    imageUrl: anime.imageUrl,
                    rating: anime.rating,
                    status: anime.status,
                    isBookmarked: anime.isBookmarked,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/anime/details',
                        arguments: {'animeId': anime.id},
                      );
                    },
                    onBookmarkTap: () {
                      // TODO: Добавить/удалить из закладок
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshIndicator(
      onRefresh: loadData,
      child: ListView(
        children: [
          _buildHorizontalList(
            title: 'Рекомендации',
            items: _recommendations,
            onShowAll: () {
              // TODO: Открыть все рекомендации
            },
          ),
          const SizedBox(height: 24),
          _buildHorizontalList(
            title: 'Новые релизы',
            items: _newReleases,
            onShowAll: () {
              // TODO: Открыть все новые релизы
            },
          ),
          const SizedBox(height: 24),
          _buildHorizontalList(
            title: 'Популярное',
            items: _popular,
            onShowAll: () {
              // TODO: Открыть все популярные
            },
          ),
        ],
      ),
    );
  }
}
