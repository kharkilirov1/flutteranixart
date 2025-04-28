import 'package:flutter/material.dart';
import '../../../widgets/anime_card.dart';
import '../../../models/anime.dart';
import '../tab_fragment.dart';

class TopScreen extends TabFragment {
  const TopScreen({super.key}) : super(title: 'Топ');

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends TabFragmentState<TopScreen> {
  String _selectedCategory = 'Все';
  String _selectedPeriod = 'За всё время';
  List<Anime> _topAnime = [];

  final List<String> _categories = [
    'Все',
    'Фильмы',
    'Сериалы',
    'OVA',
    'ONA',
  ];

  final List<String> _periods = [
    'За всё время',
    'За год',
    'За сезон',
    'За месяц',
    'За неделю',
  ];

  @override
  Future<void> loadData() async {
    setLoading(true);
    try {
      // TODO: Загрузить топ из API
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _topAnime = List.generate(
          20,
          (index) => Anime(
            id: 'anime_$index',
            title: 'Топ аниме ${index + 1}',
            rating: 5.0 - (index * 0.1),
            status: 'Завершено',
            genres: ['Боевик', 'Фэнтези'],
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

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: category == _selectedCategory,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                      loadData();
                    }
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _periods.length,
            itemBuilder: (context, index) {
              final period = _periods[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChoiceChip(
                  label: Text(period),
                  selected: period == _selectedPeriod,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedPeriod = period;
                      });
                      loadData();
                    }
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _topAnime.length,
            itemBuilder: (context, index) {
              final anime = _topAnime[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Stack(
                  children: [
                    AnimeCard(
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
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '#${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
