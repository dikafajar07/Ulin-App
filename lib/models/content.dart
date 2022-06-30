import 'package:flutter/material.dart';

class Content {
  String id, judul, deskripsi, alamat, kategori, imageUrl;
  int numofrating, htm;
  DateTime createdAt, updatedAt;

  Content({
    @required this.id,
    @required this.judul,
    @required this.deskripsi,
    @required this.alamat,
    @required this.kategori,
    @required this.imageUrl,
    @required this.numofrating,
    @required this.htm,
    @required this.createdAt,
    this.updatedAt,
  });
}
