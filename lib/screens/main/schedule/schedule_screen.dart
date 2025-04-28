import 'package:flutter/material.dart';
import '../../../models/anime.dart';
import '../../../widgets/anime_card.dart';
import '../tab_fragment.dart';

class ScheduleScreen extends TabFragment {
  const ScheduleScreen({super.key}) : super(title: 'Расписание');

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends TabFragmentState<ScheduleScreen> {
  final List<String> _days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  int _selectedDayIndex = DateTime.now().weekday - 1;
  List<Anime> _scheduleItems = [];

  @override
  Future<void> loadData() async {
    setLoading(true);
    try {
      // TODO: Загрузить реальное расписание
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _scheduleItems = List.generate(
          5,
          (index) => Anime(
            id: 'schedule_$index',
            title: 'Аниме ${index + 1}',
            rating: 4.5,
            status: 'Онгоинг',
            type: 'TV',
            episodesCount: 12,
            genres: ['Жанр 1', 'Жанр 2'],
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
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _days.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedDayIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDayIndex = index;
                  });
                  loadData();
                },
                child: Container(
                  width: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _days[index],
                      style: TextStyle(
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: _scheduleItems.isEmpty
              ? const Center(
                  child: Text('Нет запланированных релизов'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: _scheduleItems.length,
                  itemBuilder: (context, index) {
                    final anime = _scheduleItems[index];
                    return AnimeCard(
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
                    );
                  },
                ),
        ),
      ],
    );
  }
}
