import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void initVideo(String videopath) {
    videoPlayerController = VideoPlayerController.asset(
      "${videopath}",
    );
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        fullScreenByDefault: true,
      allowMuting: true,
      allowFullScreen: true,
      aspectRatio: 16/9,

    );
  }

  Future<void> stopVideo() async {
    await videoPlayerController!.pause();
  }

  List videoPath = [
   "Assets/Video/v1.mp4",
  ];
}
