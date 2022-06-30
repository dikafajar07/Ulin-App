import 'package:flutter/material.dart';

class User {
  String id, image, name, email;
  DateTime createdAt, updatedAt;

  User({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.email,
    @required this.createdAt,
    this.updatedAt,
  });
}
