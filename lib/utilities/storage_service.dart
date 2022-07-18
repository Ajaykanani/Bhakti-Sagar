import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future listOfBhagwans() async {
    ListResult result = await storage.ref("Bhakti Sagar").listAll();
    return result;
  }

  Future getBhagwanImage(String bhagwanName) async {
    ListResult result = await storage.ref("Bhakti Sagar/${bhagwanName}/images").listAll();
    return result;
  }

  Future listOfSongs(String bhagwanName) async {
    ListResult result = await storage.ref("Bhakti Sagar/${bhagwanName}/songs").listAll();
    return result;
  }

}
