import 'package:flutter/material.dart';
import '../tab_fragment.dart';

class HomeScreen extends TabFragment {
  const HomeScreen({super.key}) : super(title: 'Главная');

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends TabFragmentState<HomeScreen> {
  @override
  Future<void> loadData() async {
    setLoading(true);
    try {
      // TODO: Load home data
      await Future.delayed(const Duration(seconds: 1)); // Имитация загрузки
      setLoading(false);
    } catch (e) {
      setError(e.toString());
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: true,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // TODO: Открыть поиск
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                // TODO: Открыть уведомления
              },
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Продолжить просмотр',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // TODO: Добавить карточку аниме
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Новые релизы',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // TODO: Добавить карточку аниме
                );
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
