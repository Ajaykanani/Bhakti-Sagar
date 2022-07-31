import 'package:audioplayers/audioplayers.dart';
import 'package:bhakti_sagar/pages/more_songs_page_1.dart';
import 'package:bhakti_sagar/utilities/audio_service.dart';
import 'package:bhakti_sagar/utilities/song_controller.dart';
import 'package:bhakti_sagar/widgets/colors.dart';
import 'package:bhakti_sagar/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import '../utilities/storage_service.dart';
import 'home_page.dart';

class MoreSongsPage2 extends StatefulWidget {
  const MoreSongsPage2({Key? key, required this.bhagwanName}) : super(key: key);
  final String bhagwanName;
  @override
  State<MoreSongsPage2> createState() => _MoreSongsPage2State();
}

class _MoreSongsPage2State extends State<MoreSongsPage2> {

  final Storage storage = Storage();

  String removeExtension(String fileName1) {
    String result = "";
    List name = fileName1.split('.');

    for(int i=0; i<name.length-1; i++) {
      result += name[i];
    }

    return  result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MoreSongsPage1())
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "More Songs",
              style: TextStyle(
                color: MyColor.darkBrown,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            backgroundColor: MyColor.brown,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: MyColor.darkBrown),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MoreSongsPage1())
                );
              },
            ),
        ),
        body: Center(
          child: FutureBuilder(
            future: storage.listOfSongs(widget.bhagwanName),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Container(
                  color: MyColor.darkBrown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12.0),
                    child: ListView.builder(
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            if(SongController.songName!=snapshot.data.items[index].name) {
                              MyAudioPlayer.stopMusic();
                              SongController.songPlay = true;
                              storage.getSongUrl(
                                  snapshot.data.items[index].parent.parent.name,
                                  snapshot.data.items[index].name).then(
                                      (songUrl) {
                                        SongController.setSongDetails(
                                            bN: snapshot.data.items[index].parent.parent.name,
                                            sN: snapshot.data.items[index].name,
                                            sUrl: songUrl
                                        );
                                        SongController.songPlay = MyAudioPlayer.playMusic(songUrl);
                                      }
                              );
                              setState((){});
                            }
                          },
                          child: Card(
                            color: MyColor.brown,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ProfileWidget(userProfilePic: snapshot.data.items[index].parent.parent.name, size: 60, padding: 0),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        removeExtension(snapshot.data.items[index].name),
                                        style: TextStyle(
                                          color: MyColor.darkBrown,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              else {
                return Container(
                  alignment: Alignment.center,
                  color: MyColor.darkBrown,
                  child: CircularProgressIndicator(color: MyColor.brown,),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}