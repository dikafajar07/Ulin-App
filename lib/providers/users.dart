import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobile_ulin/models/user.dart';

import '../models/user.dart';

class Users with ChangeNotifier {
  String token, userId;

  void updateData(tokenData, uid) {
    token = tokenData;
    userId = uid;
    notifyListeners();
  }

  String urlMaster = "https://tubesabp-d7f8d-default-rtdb.firebaseio.com/";
  List<User> _allUser = [];

  List<User> get allUser => _allUser;

  Future<void> addUser(String image, String name, String email) async {
    Uri url = Uri.parse("$urlMaster/users.json?auth=$token");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "image": image,
          "name": name,
          "email": email,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
          "userId": userId,
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        User data = User(
          id: json.decode(response.body)["name"].toString(),
          image: image,
          name: name,
          email: email,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _allUser.add(data);
        notifyListeners();
      }
    } catch (err) {
      rethrow;
    }
  }

  void editUser(String id, String image, String name, String email) async {
    Uri url = Uri.parse("$urlMaster/users/$id.json?auth=$token");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "image": image,
          "name": name,
          "email": email,
          "updatedAt": date.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        User edit = _allUser.firstWhere((element) => element.id == id);
        edit.image = image;
        edit.name = name;
        edit.email = email;
        edit.updatedAt = date;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void deleteUser(String id) async {
    Uri url = Uri.parse("$urlMaster/users/$id.json?auth=$token");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allUser.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  User selectById(String id) {
    return _allUser.firstWhere((element) => element.id == id);
  }

  Future<void> inisialData() async {
    _allUser = [];
    Uri url = Uri.parse(
        '$urlMaster/users.json?auth=$token&orderBy="userId"&equalTo="$userId"');

    try {
      var response = await http.get(url);

      print(response.statusCode);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;
        if (data != null) {
          data.forEach(
            (key, value) {
              User prod = User(
                id: key,
                image: value["image"],
                name: value["name"],
                email: value["email"],
                createdAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
                updatedAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
              );
              _allUser.add(prod);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }
}
