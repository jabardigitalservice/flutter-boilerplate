import 'dart:convert';


import '../constants/endpoints.dart';
import '../models/photo_model.dart';

class PhotoRepository {
  final dynamic client;

  const PhotoRepository(this.client);

  Future<List<PhotoModel>> getPhotos() async {
    return await client.get('https://jsonplaceholder.typicode.com/photos').then((dynamic res) {
      return listPhotosFromJson(jsonEncode(res));
    });
  }

}