import 'package:bhakti_sagar/pages/temp2.dart';
import 'package:flutter/material.dart';

import '../utilities/storage_service.dart';

class TempPage extends StatefulWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temp")),
      body: Center(
        child: FutureBuilder(
          future: storage.listOfBhagwans(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.prefixes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.prefixes[index].name),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Temp2Page(bhagwanName: snapshot.data.prefixes[index].name)),
                        );
                      },
                    );
                  },
                ),
              );
            }
            else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
