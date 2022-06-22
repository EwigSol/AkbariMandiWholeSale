import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessModel {
  String? id;
  String? name;
  String? businessName;
  String? businessPhone;
  String? reffererName;
  String? reffererPhone;
  String? frontImageUrl;
  String? insideImageUrl;
  String? insideImageUrlTwo;

  BusinessModel({
    this.id,
    this.name,
    this.businessName,
    this.businessPhone,
    this.reffererName,
    this.reffererPhone,
    this.frontImageUrl,
    this.insideImageUrl,
    this.insideImageUrlTwo,
  });

  BusinessModel.fromFirestore(DocumentSnapshot doc) {
    id = doc['id'];
    name = doc['name'];
    businessName = doc['businessName'];
    businessPhone = doc['businessPhone'];
    reffererName = doc['reffererName'];
    reffererPhone = doc['reffererPhone'];
    frontImageUrl = doc['frontImageUrl'];
    insideImageUrl = doc['insideImageUrl'];
    insideImageUrlTwo = doc['insideImageUrl'];
  }
}