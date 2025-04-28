import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'base_player.dart';

class AnimeVideoPlayer extends BasePlayer {
  const AnimeVideoPlayer({
    super.key,
    required super.title,
    required super.url,
    required super.episode,
    required super.totalEpisodes,
  });

  @override
  State<AnimeVideoPlayer> createState() => _AnimeVideoPlayerState();
}

class _AnimeVideoPlayerState extends BasePlayerState<AnimeVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  Color? _primaryColor;

  @override
  void initState() {
    super.initState();
    _primaryColor = Theme.of(context).primaryColor;
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
    );

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowMuting: true,
      showControls: true,
      placeholder: Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      materialProgressColors: ChewieProgressColors(
        playedColor: _primaryColor!,
        handleColor: _primaryColor!,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey[300]!,
      ),
    );

    _videoPlayerController.addListener(() {
      setPosition(_videoPlayerController.value.position);
      setDuration(_videoPlayerController.value.duration);
      setPlaying(_videoPlayerController.value.isPlaying);
      setBuffering(_videoPlayerController.value.isBuffering);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: _chewieController != null
              ? Chewie(controller: _chewieController!)
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
