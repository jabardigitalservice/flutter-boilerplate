import 'dart:convert';

import 'package:flutter_boilerplate/config/network/dio_client.dart';
import 'package:flutter_boilerplate/constants/endpoints.dart';
import 'package:flutter_boilerplate/models/user/user_model.dart';

class UserRepository {
  // dio instance
  final DioClient _dioClient = DioClient();

  Future<ListUserModel> getUsers() async {
    return await _dioClient.get(Endpoints.getUsers).then((dynamic res) {
      return ListUserModel.fromJson(res);
    });
  }

}