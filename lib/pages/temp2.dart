import 'package:flutter/material.dart';

import '../utilities/storage_service.dart';

class Temp2Page extends StatefulWidget {
  const Temp2Page({required this.bhagwanName});
  final String bhagwanName;
  @override
  State<Temp2Page> createState() => _Temp2PageState();
}

class _Temp2PageState extends State<Temp2Page> {
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temp2")),
      body: Center(
        child: FutureBuilder(
          future: storage.listOfSongs(widget.bhagwanName),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.items[index].name),
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
