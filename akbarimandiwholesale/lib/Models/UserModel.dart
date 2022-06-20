// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? description;
  String? imageUrl;
  bool? direct;
  bool? tag;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.description,
    this.imageUrl,
    this.direct,
    this.tag,
  });

  UserModel.fromFirestore(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    description = doc['description'];
    imageUrl = doc['imageUrl'];
    direct = doc['direct'];
    tag = doc['tag'];
  }
}
