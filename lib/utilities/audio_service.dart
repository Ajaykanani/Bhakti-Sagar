import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  static final player = AudioPlayer();

  static playMusic(String url) async {
    await player.play(DeviceFileSource(url)).then(
            (value) {
              return false;
            }
            );
  }
  static playMusicFromAsset(String path) async {
    await player.setSourceAsset(path).then(
            (value) async{
             await player.resume();
              return false;
        }
    );
  }
  static pauseMusic() async {
    await player.pause();
  }
  static resumeMusic() async {
    await player.resume();
  }
  static stopMusic() async {
    await player.stop();
  }
}