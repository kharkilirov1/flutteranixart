import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final String currentVersion;
  final String newVersion;
  final String changelog;
  final bool isRequired;

  const UpdateScreen({
    super.key,
    required this.currentVersion,
    required this.newVersion,
    required this.changelog,
    this.isRequired = false,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;

  void _startUpdate() {
    setState(() {
      _isDownloading = true;
    });

    // Имитация загрузки
    Future.delayed(const Duration(milliseconds: 500), () {
      for (var i = 0; i < 100; i++) {
        Future.delayed(Duration(milliseconds: 50 * i), () {
          if (mounted) {
            setState(() {
              _downloadProgress = i / 100;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.system_update,
                size: 64,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              Text(
                'Доступно обновление',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Версия ${widget.newVersion}',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Что нового:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(widget.changelog),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (_isDownloading) ...[
                LinearProgressIndicator(
                  value: _downloadProgress,
                ),
                const SizedBox(height: 8),
                Text(
                  'Загрузка: ${(_downloadProgress * 100).toInt()}%',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: _startUpdate,
                  child: const Text('Обновить сейчас'),
                ),
                if (!widget.isRequired) ...[
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Позже'),
                  ),
                ],
              ],
              const SizedBox(height: 24),
              Text(
                'Текущая версия: ${widget.currentVersion}',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
