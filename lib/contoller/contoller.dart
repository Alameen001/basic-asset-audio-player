import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:music1/screens/musics/mymusic.dart';

final assetsAudioPlayer = AssetsAudioPlayer();
void play(List<Audio> audio, int index) {
  // int index = ind == null ? 0 : ind;
  assetsAudioPlayer.open(Playlist(audios: songs, startIndex: index),
      // showNotification: Notification,
      notificationSettings: NotificationSettings(stopEnabled: false));
}
