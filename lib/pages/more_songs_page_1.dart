import 'package:bhakti_sagar/pages/more_songs_page_2.dart';
import 'package:bhakti_sagar/widgets/colors.dart';
import 'package:bhakti_sagar/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import '../utilities/storage_service.dart';

class MoreSongsPage1 extends StatefulWidget {
  const MoreSongsPage1({Key? key}) : super(key: key);

  @override
  State<MoreSongsPage1> createState() => _MoreSongsPage1State();
}

class _MoreSongsPage1State extends State<MoreSongsPage1> {
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          backgroundColor: MyColor.brown
      ),
      body: Center(
        child: FutureBuilder(
          future: storage.listOfBhagwans(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Container(
                color: MyColor.darkBrown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 12.0),
                  child: ListView.builder(
                    itemCount: snapshot.data.prefixes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MoreSongsPage2(bhagwanName: snapshot.data.prefixes[index].name)),
                          );
                        },
                        child: Card(
                          color: MyColor.brown,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ProfileWidget(userProfilePic: snapshot.data.prefixes[index].name, size: 60, padding: 0),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data.prefixes[index].name,
                                    style: TextStyle(
                                      color: MyColor.darkBrown,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
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
    );
  }
}