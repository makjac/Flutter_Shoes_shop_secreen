// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Shoe {
  final String title;
  final List<String> features;
  final double rating;
  final int price;
  final double number;
  final String image;
  final String shoeProfileImg;
  Shoe({
    required this.title,
    required this.features,
    required this.rating,
    required this.price,
    required this.number,
    required this.image,
    required this.shoeProfileImg,
  });

  Shoe copyWith({
    String? title,
    List<String>? features,
    double? rating,
    int? price,
    double? number,
    String? image,
    String? shoeProfileImg,
  }) {
    return Shoe(
      title: title ?? this.title,
      features: features ?? this.features,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      number: number ?? this.number,
      image: image ?? this.image,
      shoeProfileImg: shoeProfileImg ?? this.shoeProfileImg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'features': features,
      'rating': rating,
      'price': price,
      'number': number,
      'image': image,
      'shoeProfileImg': shoeProfileImg,
    };
  }

  factory Shoe.fromMap(Map<String, dynamic> map) {
    return Shoe(
      title: map['title'] as String,
      features: List<String>.from(map['features'] as List<String>),
      rating: map['rating'] as double,
      price: map['price'] as int,
      number: map['number'] as double,
      image: map['image'] as String,
      shoeProfileImg: map['shoeProfileImg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shoe.fromJson(String source) =>
      Shoe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shoe(title: $title, features: $features, rating: $rating, price: $price, number: $number, image: $image, shoeProfileImg: $shoeProfileImg)';
  }

  String featuresToString() {
    String label = features[0];
    for (int i = 1; i < features.length; i++) {
      label = "${features[i]} / $label";
    }
    return label;
  }

  @override
  bool operator ==(covariant Shoe other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        listEquals(other.features, features) &&
        other.rating == rating &&
        other.price == price &&
        other.number == number &&
        other.image == image &&
        other.shoeProfileImg == shoeProfileImg;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        features.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        number.hashCode ^
        image.hashCode ^
        shoeProfileImg.hashCode;
  }
}
