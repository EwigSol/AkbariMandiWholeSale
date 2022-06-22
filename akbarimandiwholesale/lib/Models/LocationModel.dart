import 'package:cloud_firestore/cloud_firestore.dart';

class SocialMediaModel {
  String? latitude;
  String? longitude;

  SocialMediaModel({
    this.latitude,
    this.longitude,
  });

  SocialMediaModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    latitude = doc.get('latitude');
    longitude = doc.get('longitude');
  }
}
