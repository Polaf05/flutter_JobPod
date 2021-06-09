import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jobpod/models/user.dart';

class DatabaseService {
  // Get user Id
  final String uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  // User information

  Future createUserData(String name, String email, String username) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'email': email,
      'username': username,
      'bio': "Too Lazy to add some Bio",
      'displayPicture':
          "https://firebasestorage.googleapis.com/v0/b/flutter-jobpod.appspot.com/o/Assets%2FdefaultPicture%2Feasy-tite-1.png?alt=media&token=e7f9f964-a2fe-4853-ad65-582725ba5e32",
    });
  }
  // Check if record os existing

  Future checkUserData(String name, String email, String username) async {
    var docRef = userCollection.doc(uid);

    docRef
        .get()
        .then((doc) => {
              if (doc.exists)
                print(doc)
              else
                createUserData(name, email, username)
            })
        .onError((error, stackTrace) => null);
  }
}
