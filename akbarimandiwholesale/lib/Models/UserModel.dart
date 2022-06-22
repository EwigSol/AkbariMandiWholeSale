// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? pass;
  String? phone;

  UserModel({this.id, this.name, this.email, this.pass, this.phone});

  UserModel.fromFirestore(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    pass = doc['passKey'];
    phone = doc['phone'];
  }
}
