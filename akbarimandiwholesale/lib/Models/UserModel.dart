// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? pass;
  String? phone;
  String? businessName;
  String? businessPhone;
  String? reffererName;
  String? reffererPhone;
  String? frontImageUrl;
  String? insideImageUrl;
  String? insideImageUrlTwo;
  String? latitude;
  String? longitude;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.pass,
    this.phone,
    this.businessName,
    this.businessPhone,
    this.reffererName,
    this.reffererPhone,
    this.frontImageUrl,
    this.insideImageUrl,
    this.insideImageUrlTwo,
    this.latitude,
    this.longitude,
  });

  UserModel.fromFirestore(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    email = doc['email'];
    pass = doc['passKey'];
    phone = doc['phone'];
    businessName = doc['businessName'];
    businessPhone = doc['businessPhone'];
    reffererName = doc['reffererName'];
    reffererPhone = doc['reffererPhone'];
    frontImageUrl = doc['frontImageUrl'];
    insideImageUrl = doc['insideImageUrl'];
    insideImageUrlTwo = doc['insideImageUrlTwo'];
    latitude = doc['latitude'];
    longitude = doc['longitude'];
  }
}
