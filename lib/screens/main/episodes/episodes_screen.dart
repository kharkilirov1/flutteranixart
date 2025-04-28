import 'package:flutter/material.dart';

class EpisodesScreen extends StatefulWidget {
  final String title;
  final int totalEpisodes;

  const EpisodesScreen({
    super.key,
    required this.title,
    required this.totalEpisodes,
  });

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Серии', 'Торренты'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title),
            Text(
              'Всего серий: ${widget.totalEpisodes}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEpisodesTab(),
          _buildTorrentsTab(),
        ],
      ),
    );
  }

  Widget _buildEpisodesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.totalEpisodes,
      itemBuilder: (context, index) {
        final episodeNumber = index + 1;
        return Card(
          child: ListTile(
            leading: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  'EP $episodeNumber',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text('Серия $episodeNumber'),
            subtitle: const Text('Длительность: 24 мин'),
            trailing: const Icon(Icons.play_arrow),
            onTap: () {
              // TODO: Запустить просмотр серии
            },
          ),
        );
      },
    );
  }

  Widget _buildTorrentsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Торрент ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Размер: ${(index + 1) * 500} MB'),
                Text('Сиды: ${(index + 1) * 10}'),
                const LinearProgressIndicator(
                  value: 0.0,
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                // TODO: Начать загрузку торрента
              },
            ),
          ),
        );
      },
    );
  }
}
