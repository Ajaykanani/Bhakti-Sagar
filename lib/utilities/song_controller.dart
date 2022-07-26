class SongController {
  static bool songPlay = false;
  static String bhagwanName="";
  static String songName="";
  static String songUrl="";
  static setSongDetails({required String bN,required String sN,required String sUrl}) {
    bhagwanName = bN;
    songName = sN;
    songUrl = sUrl;
  }
}