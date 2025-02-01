import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms_app/global_widgets/video_player.dart';
import 'package:video_player/video_player.dart';
// Import your existing widget

class NewVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  final String? title;
  final bool autoPlay;
  final bool looping;

  const NewVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.thumbnail,
    this.title,
    this.autoPlay = false,
    this.looping = false,
  });

  @override
  _NewVideoPlayerState createState() => _NewVideoPlayerState();
}

class _NewVideoPlayerState extends State<NewVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  bool _videoError = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
      // if (_videoPlayerController.value.isInitialized) return; 
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            if (mounted) {
              setState(() {
                _isInitialized = true;
                _videoError = false; // Video loaded successfully
              });
            }
          }).catchError((error) {
            setState(() {
              _videoError = true; // Error in loading video
            });
          });

    _videoPlayerController.addListener(_videoListener);
  }

  void _videoListener() {
    if (_videoPlayerController.value.hasError) {
      setState(() {
        _videoError = true;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_videoListener);
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoError
        ? _buildThumbnail() // Show thumbnail if video fails
        : _isInitialized ? ChewieVideoPlayer(
            key: ValueKey(widget.videoUrl),
            videoPlayerController: _videoPlayerController,
            title: widget.title,
            autoPlay: widget.autoPlay,
            looping: widget.looping,
          ): Center(child: CircularProgressIndicator())
          ;
  }

  Widget _buildThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        height: 120,
        width: double.infinity,
        imageUrl: widget.thumbnail,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => SizedBox(
          height: 120,
          child: Center(
            child: Icon(
              Icons.broken_image_outlined,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
