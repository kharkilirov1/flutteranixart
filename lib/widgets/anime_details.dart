import 'package:flutter/material.dart';

class AnimeDetails extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String? description;
  final double rating;
  final String status;
  final List<String> genres;
  final String type;
  final int episodesCount;
  final int year;
  final VoidCallback? onWatchPressed;
  final VoidCallback? onBookmarkPressed;
  final bool isBookmarked;

  const AnimeDetails({
    super.key,
    required this.title,
    this.imageUrl,
    this.description,
    required this.rating,
    required this.status,
    required this.genres,
    required this.type,
    required this.episodesCount,
    required this.year,
    this.onWatchPressed,
    this.onBookmarkPressed,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (imageUrl != null)
                  Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  )
                else
                  Container(color: Colors.grey[300]),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 179), // 0.7 * 255 ≈ 179
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onWatchPressed,
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Смотреть'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      ),
                      onPressed: onBookmarkPressed,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(status),
                    const SizedBox(width: 16),
                    Text('$year год'),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: genres.map((genre) {
                    return Chip(
                      label: Text(genre),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text('$type • $episodesCount эп.'),
                if (description != null) ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Описание',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description!),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
