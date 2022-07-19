import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newproject/api/api.dart';

//Get
class Data {
  static Future<List> getData() async {
    late List user = [];

    await http
        .get(Uri.parse(url))
        .then((value) => user = jsonDecode(value.body));

    return user;
  }
}

//update and delete
class Edit {
  Future<void> deleteData(String id) async {
    await http.delete(Uri.parse('$url/$id'));
  }

  Future<void> updateData(String id, String updatedName) async {
    await http
        .put(
          Uri.parse('$url/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': updatedName,
          }),
        )
        .then((value) => {});
  }
}

//Add
class Helper {
  Future<void> addUser(
    String newUserName,
  ) async {
    await http
        .post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'name': newUserName,
          }),
        )
        .then((value) => {});
  }
}
