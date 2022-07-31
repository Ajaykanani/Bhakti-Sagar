import 'dart:math';

import 'package:bhakti_sagar/pages/more_songs_page_1.dart';
import 'package:bhakti_sagar/widgets/colors.dart';
import 'package:flutter/material.dart';

import '../utilities/audio_service.dart';
import '../utilities/song_controller.dart';
import '../utilities/storage_service.dart';
import '../widgets/firing_spirit_lamp_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  bool spiritPlay = false;
  bool spiritClicked = true;
  final Storage storage = Storage();

  void spiritPlayStart() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController!.repeat();
  }

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Bhakti Sagar",
            style: TextStyle(
              color: MyColor.darkBrown,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          backgroundColor: MyColor.brown,
        leading: null,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: height*0.64,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/frame.jpg",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                top: height*0.043,
                left: width*0.08,
                child: SongController.bhagwanName == ""
                    ? Container(
                        height: height*0.555,
                        width: width*0.84,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/hanuman.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    :
                FutureBuilder(
                  future: storage.getBhagwanImage(SongController.bhagwanName),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                      return Container(
                        height: height*0.555,
                        width: width*0.84,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data.toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: height*0.555,
                        width: width*0.84,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(color: MyColor.brown),
                      );
                    }
                  },
                )
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: height*0.12,
                  width: height*0.12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bell.png",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: height*0.12,
                  width: height*0.12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bell.png",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Positioned(
                bottom: height*0.04,
                left: width*0.05,
                child: Container(
                  height: height*0.12,
                  width: height*0.08,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/shankh.png",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Positioned(
                bottom: height*0.04,
                right: 0,
                child: Container(
                  height: height*0.08,
                  width: height*0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/flower.png",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              spiritPlay
                  ? Positioned(
                      child: AnimatedBuilder(
                        animation: _animationController!,
                        builder: <Widget>(BuildContext context, Widget child) {
                          return Transform.translate(
                            offset: Offset(
                              (width/2) -
                                  25 +
                                  cos((_animationController!.value * 360 * pi) /
                                          90) *
                                      100,
                              height*0.35 +
                                  sin((_animationController!.value * 360 * pi) /
                                          90) *
                                      90,
                            ),
                            child: FiringSpiritLampWidget(lamp: true),
                          );
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: height*0.065,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: MyColor.darkBrown,
                    indicatorColor: MyColor.darkBrown,
                    indicatorWeight: 3.2,
                    labelPadding: EdgeInsets.symmetric(horizontal: 70),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 60),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "Repeat Song",
                      ),
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Song Controls",
                      )
                    ],
                  ),
                ),
                Container(
                  height: height*0.177,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        color: MyColor.amberAccent,
                      ),
                      Container(
                        color: MyColor.brown,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  if(SongController.songPlay == false) {
                                    SongController.songPlay = true;
                                    if(SongController.songUrl != ""){
                                      MyAudioPlayer.playMusic(SongController.songUrl);
                                    }
                                    else {
                                      MyAudioPlayer.playMusicFromAsset("songs/HanumanChalisa.mp3");
                                    }
                                  }
                                  else {
                                    SongController.songPlay = false;
                                    MyAudioPlayer.pauseMusic();
                                  }
                                  setState((){});
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: MyColor.white,
                                      radius: 25,
                                      child: CircleAvatar(
                                        backgroundColor: MyColor.brown,
                                        radius: 22,
                                        child: Icon(
                                          SongController.songPlay ==true?Icons.stop_sharp:Icons.play_arrow,
                                          color: MyColor.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        SongController.songPlay ==true?"Stop":"Play",
                                        style: TextStyle(
                                          color: MyColor.darkBrown,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (spiritClicked) {
                                    setState(() {
                                      spiritPlayStart();
                                      spiritClicked = false;
                                      spiritPlay = true;
                                    });
                                  } else {
                                    setState(() {
                                      spiritClicked = true;
                                      spiritPlay = false;
                                    });
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: FiringSpiritLampWidget(
                                      lamp: spiritClicked),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => MoreSongsPage1()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.more_vert_rounded,
                                      size: 60,
                                    ),
                                    Text(
                                      "More",
                                      style: TextStyle(
                                        color: MyColor.darkBrown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: MyColor.indigo,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
