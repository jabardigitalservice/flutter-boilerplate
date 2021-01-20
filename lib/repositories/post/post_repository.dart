import 'dart:convert';

import 'package:flutter_boilerplate/config/network/dio_client.dart';
import 'package:flutter_boilerplate/constants/endpoints.dart';
import 'package:flutter_boilerplate/models/post/post_model.dart';

class PostRepository {
  // dio instance
  final DioClient _dioClient = DioClient();

  Future<List<PostModel>> getPosts() async {
      return await _dioClient.get(Endpoints.getPosts).then((dynamic res) {
        return listPostModelFromJson(jsonEncode(res));
      });
  }

}