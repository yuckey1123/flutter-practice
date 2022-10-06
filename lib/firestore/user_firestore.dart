import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserFirestore {
  static FirebaseFirestore _firebaseFirestoreInstance = FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection('user');

  static Future<void> createUser() async {
    try {
      await _userCollection.add({
        'name': 'チェンバー',
        'image_path': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmJjWmOaEIRhHJTXoPs9OF-kzsdbS7OTbGew&usqp=CAU'
      });

      print('アカウント作成完了');

    } catch (e) {
      print('アカウント作成失敗 ----- $e');
    }
  }
}
