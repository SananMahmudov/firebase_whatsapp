import 'package:cloud_firestore/cloud_firestore.dart';

class UsersService {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() async* {
    yield* FirebaseFirestore.instance.collection('users').snapshots();
  }
}
