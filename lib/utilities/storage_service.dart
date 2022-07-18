import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future listOfBhagwans() async {
    return await storage.ref("Bhakti Sagar").listAll();
  }

  Future getBhagwanImage(String bhagwanName) async {
    var result =  await storage.ref("Bhakti Sagar/${bhagwanName}/images").child("${bhagwanName}.jpeg").getDownloadURL();
    return result;
  }

  Future listOfSongs(String bhagwanName) async {
    var result = await storage.ref("Bhakti Sagar/${bhagwanName}/songs").listAll();
    return result;
  }
}
