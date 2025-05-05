import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoReader extends StatefulWidget {
  final String youtubeUrl;
  final String thumbnailUrl;

  const YoutubeVideoReader({
    super.key,
    required this.youtubeUrl,
    required this.thumbnailUrl,
  });

  @override
  State<YoutubeVideoReader> createState() => _YoutubeVideoReaderState();
}

class _YoutubeVideoReaderState extends State<YoutubeVideoReader> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  void _showVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              builder: (context, player) {
                return AspectRatio(aspectRatio: 16 / 9, child: player);
              },
            ),
          ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showVideoDialog(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.thumbnailUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
        ],
      ),
    );
  }
}
