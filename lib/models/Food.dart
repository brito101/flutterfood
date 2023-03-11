// ignore_for_file: file_names

import 'dart:convert';

class Food {
  String identify;
  String title;
  String description;
  String price;
  String image;

  Food(
      {required this.identify,
      required this.title,
      required this.description,
      required this.price,
      required this.image});

  factory Food.fromJson(jsonData) {
    return Food(
        identify: jsonData['identify'],
        title: jsonData['title'],
        description: jsonData['description'],
        price: jsonData['price'],
        image: jsonData['image']);
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    });
  }
}
