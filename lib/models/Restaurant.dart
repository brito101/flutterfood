// ignore_for_file: file_names

import 'dart:convert';

class Restaurant {
  String uuid;
  String name;
  String image;
  String contact;

  Restaurant(
      {required this.uuid,
      required this.name,
      required this.image,
      required this.contact});

  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
        uuid: jsonData['uuid'],
        name: jsonData['name'],
        image: jsonData['image'],
        contact: jsonData['contact']);
  }

  toJson() {
    return jsonEncode({
      'uuid': uuid,
      'name': name,
      'image': image,
      'contact': contact,
    });
  }
}
