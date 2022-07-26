import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future listOfBhagwans() async {
    var result = await storage.ref("Bhakti Sagar").listAll();
    return result;
  }

  Future getBhagwanImage(String bhagwanName) async {
    var result =  await storage.ref("Bhakti Sagar/${bhagwanName}/images").child("${bhagwanName}.jpeg").getDownloadURL();
    return result;
  }

  Future listOfSongs(String bhagwanName) async {
    var result = await storage.ref("Bhakti Sagar/${bhagwanName}/songs").listAll();
    return result;
  }

  Future<String> getSongUrl(String bhagwanName,String songName) async {
    String result = await storage.ref("Bhakti Sagar/${bhagwanName}/songs").child(songName).getDownloadURL();
    return result;
  }

}
