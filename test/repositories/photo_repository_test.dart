import 'dart:convert';

import 'package:flutter_boilerplate/config/network/dio_client.dart';
import 'package:flutter_boilerplate/models/photo_model.dart';
import 'package:flutter_boilerplate/repositories/photo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements DioClient {}

void main() {
  MockClient client;
  PhotoRepository repository;

  // Registers a function to be run before tests.
  // This function will be called before each test is run.
  setUp(() {
    client = MockClient();
    repository = PhotoRepository(client);
  });

  group('getPhotos', () {
    test('returns list of photos if the http call completes successfully',
        () async {
      // Dummy API response
      final responsePayload = jsonEncode([
        {
          "albumId": 1,
          "id": 1,
          "title": "a",
          "url": "b",
          "thumbnailUrl": "c"
        }
      ]);

      // Use Mockito to return a successful response when it calls the
      // provided DioClient.
      when(client.get('https://jsonplaceholder.typicode.com/photos'))
          .thenAnswer((_) async => jsonDecode(responsePayload));

      final response = await repository.getPhotos();

      List<PhotoModel> listPhoto = [PhotoModel(
        albumId : 1,
        id : 1,
        title : "a",
        url : "b",
        thumbnailUrl: "c")];

      expect(response, isA<List<PhotoModel>>());
      expect(response, equals(listPhoto));
    });
  });
}
