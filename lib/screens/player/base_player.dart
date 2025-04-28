import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BasePlayer extends StatefulWidget {
  final String title;
  final String url;
  final int episode;
  final int totalEpisodes;

  const BasePlayer({
    super.key,
    required this.title,
    required this.url,
    required this.episode,
    required this.totalEpisodes,
  });
}

abstract class BasePlayerState<T extends BasePlayer> extends State<T> {
  bool _isFullScreen = false;
  bool _isPlaying = false;
  bool _isBuffering = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  // Геттер для доступа к состоянию буферизации
  bool get isBuffering => _isBuffering;

  void toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      if (_isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    });
  }

  void setPlaying(bool playing) {
    setState(() {
      _isPlaying = playing;
    });
  }

  void setBuffering(bool buffering) {
    setState(() {
      _isBuffering = buffering;
    });
  }

  void setPosition(Duration position) {
    setState(() {
      _position = position;
    });
  }

  void setDuration(Duration duration) {
    setState(() {
      _duration = duration;
    });
  }

  Widget buildControls() {
    return Stack(
      children: [
        // Overlay для затемнения фона
        Container(
          color: Colors.black.withValues(alpha: 128), // 0.5 * 255 = 128
        ),

        // Центральные кнопки управления
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                color: Colors.white,
                iconSize: 48,
                onPressed: widget.episode > 1
                    ? () {
                        // TODO: Переключить на предыдущую серию
                      }
                    : null,
              ),
              const SizedBox(width: 32),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                color: Colors.white,
                iconSize: 64,
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                  // TODO: Запустить/остановить воспроизведение
                },
              ),
              const SizedBox(width: 32),
              IconButton(
                icon: const Icon(Icons.skip_next),
                color: Colors.white,
                iconSize: 48,
                onPressed: widget.episode < widget.totalEpisodes
                    ? () {
                        // TODO: Переключить на следующую серию
                      }
                    : null,
              ),
            ],
          ),
        ),

        // Нижняя панель с прогрессом
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _formatDuration(_position),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        value: _position.inSeconds.toDouble(),
                        max: _duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          // TODO: Перемотать видео
                          setPosition(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    Text(
                      _formatDuration(_duration),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.title} - Серия ${widget.episode}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(_isFullScreen
                          ? Icons.fullscreen_exit
                          : Icons.fullscreen),
                      color: Colors.white,
                      onPressed: toggleFullScreen,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
}
