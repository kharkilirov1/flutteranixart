import 'package:flutter/material.dart';
import '../../../widgets/anime_card.dart';
import '../tab_fragment.dart';
import '../../../models/anime.dart';

class BookmarksScreen extends TabFragment {
  const BookmarksScreen({super.key}) : super(title: 'Закладки');

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends TabFragmentState<BookmarksScreen> {
  List<Anime> _bookmarks = [];

  @override
  Future<void> loadData() async {
    setLoading(true);
    try {
      // TODO: Загрузить закладки из API
      await Future.delayed(const Duration(seconds: 1));

      // Временные данные
      _bookmarks = List.generate(
        10,
        (index) => Anime(
          id: 'anime_$index',
          title: 'Аниме $index',
          rating: 4.5 + (index / 10),
          status: 'Онгоинг',
          genres: ['Боевик', 'Фэнтези'],
          type: 'TV',
          episodesCount: 12,
          year: 2024,
          isBookmarked: true,
        ),
      );

      setLoading(false);
    } catch (e) {
      setError(e.toString());
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    if (_bookmarks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bookmark_border,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'Нет закладок',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Добавьте аниме в закладки,\nчтобы быстро находить его позже',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: _bookmarks.length,
      itemBuilder: (context, index) {
        final anime = _bookmarks[index];
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
          onBookmarkTap: () async {
            // TODO: Удалить из закладок
            setState(() {
              _bookmarks.removeAt(index);
            });
          },
        );
      },
    );
  }
}
