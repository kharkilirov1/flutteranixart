import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> _selectedGenres = [];
  String _selectedStatus = 'Все';
  double _minRating = 0;
  String _sortBy = 'По популярности';

  final List<String> _genres = [
    'Боевик',
    'Приключения',
    'Комедия',
    'Драма',
    'Фэнтези',
    'Романтика',
    'Спорт',
    'Повседневность',
    'Мистика',
    'Ужасы',
  ];

  final List<String> _statuses = [
    'Все',
    'Онгоинг',
    'Завершен',
    'Анонс',
  ];

  final List<String> _sortOptions = [
    'По популярности',
    'По рейтингу',
    'По дате',
    'По названию',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтры'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedGenres.clear();
                _selectedStatus = 'Все';
                _minRating = 0;
                _sortBy = 'По популярности';
              });
            },
            child: const Text('Сбросить'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Жанры',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _genres.map((genre) {
              final isSelected = _selectedGenres.contains(genre);
              return FilterChip(
                label: Text(genre),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedGenres.add(genre);
                    } else {
                      _selectedGenres.remove(genre);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Статус',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _statuses.map((status) {
              return ChoiceChip(
                label: Text(status),
                selected: _selectedStatus == status,
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _selectedStatus = status;
                    });
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Минимальный рейтинг',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _minRating,
                  min: 0,
                  max: 5,
                  divisions: 10,
                  label: _minRating.toStringAsFixed(1),
                  onChanged: (value) {
                    setState(() {
                      _minRating = value;
                    });
                  },
                ),
              ),
              Container(
                width: 48,
                alignment: Alignment.center,
                child: Text(
                  _minRating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Сортировка',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _sortOptions.map((option) {
              return ChoiceChip(
                label: Text(option),
                selected: _sortBy == option,
                onSelected: (selected) {
                  if (selected) {
                    setState(() {
                      _sortBy = option;
                    });
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // TODO: Применить фильтры и вернуться к поиску
              Navigator.pop(context, {
                'genres': _selectedGenres,
                'status': _selectedStatus,
                'minRating': _minRating,
                'sortBy': _sortBy,
              });
            },
            child: const Text('Применить'),
          ),
        ),
      ),
    );
  }
}
