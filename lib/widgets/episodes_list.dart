import 'package:flutter/material.dart';

class EpisodesList extends StatelessWidget {
  final int totalEpisodes;
  final int currentEpisode;
  final Function(int) onEpisodeSelected;

  const EpisodesList({
    super.key,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.onEpisodeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: totalEpisodes,
      itemBuilder: (context, index) {
        final episodeNumber = index + 1;
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('$episodeNumber'),
            ),
            title: Text('Эпизод $episodeNumber'),
            trailing: episodeNumber == currentEpisode
                ? const Icon(Icons.play_arrow)
                : null,
            onTap: () => onEpisodeSelected(episodeNumber),
          ),
        );
      },
    );
  }
}
