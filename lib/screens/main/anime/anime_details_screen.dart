import 'package:flutter/material.dart';
import '../../../models/comment.dart';
import '../../../widgets/anime_details.dart';
import '../../../widgets/episodes_list.dart';
import '../../../widgets/comments_list.dart';

class AnimeDetailsScreen extends StatefulWidget {
  final String animeId;

  const AnimeDetailsScreen({
    super.key,
    required this.animeId,
  });

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    // TODO: Загрузить данные аниме
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: AnimeDetails(
                  title: 'Название аниме',
                  imageUrl: null,
                  description: 'Описание аниме...',
                  rating: 4.5,
                  status: 'Онгоинг',
                  genres: const ['Боевик', 'Фэнтези', 'Приключения'],
                  type: 'TV',
                  episodesCount: 12,
                  year: 2024,
                  onWatchPressed: () {
                    // TODO: Начать просмотр
                  },
                  onBookmarkPressed: () {
                    // TODO: Добавить в закладки
                  },
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    tabs: [
                      Tab(text: 'Серии'),
                      Tab(text: 'Похожее'),
                      Tab(text: 'Комментарии'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              EpisodesList(
                totalEpisodes: 12,
                currentEpisode: 1,
                onEpisodeSelected: (episode) {
                  // TODO: Открыть серию
                },
              ),
              GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('Похожее аниме $index'),
                    ),
                  );
                },
              ),
              CommentsList(
                comments: List.generate(
                  20,
                  (index) => Comment(
                    id: index,
                    userId: index + 100,
                    username: 'Пользователь $index',
                    text: 'Комментарий $index',
                    createdAt: DateTime.now().subtract(
                      Duration(minutes: index * 10),
                    ),
                    likes: index * 2,
                    replies: index,
                  ),
                ),
                onLike: (commentId) {
                  // TODO: Поставить лайк
                },
                onReply: (commentId) {
                  // TODO: Ответить на комментарий
                },
                onAuthorTap: (commentId) {
                  // TODO: Открыть профиль автора
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
