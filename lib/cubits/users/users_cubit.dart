import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_wp/data/services/users_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() =>
      UsersService.getUsers();
}
