import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'base_player.dart';

class WebPlayer extends BasePlayer {
  const WebPlayer({
    super.key,
    required super.title,
    required super.url,
    required super.episode,
    required super.totalEpisodes,
  });

  @override
  State<WebPlayer> createState() => _WebPlayerState();
}

class _WebPlayerState extends BasePlayerState<WebPlayer> {
  late WebViewController _controller;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setBuffering(true);
          },
          onPageFinished: (String url) {
            setBuffering(false);
            setPlaying(true);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_showControls)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showControls = false;
                  });
                },
                child: buildControls(),
              ),
            if (isBuffering)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
