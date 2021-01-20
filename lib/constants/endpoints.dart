import 'package:flutter_boilerplate/config/environment_config.dart';

class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = EnvironmentConfig.BASE_URL;

  // post endpoints
  static const String getPosts = baseUrl + "/posts";

  // user endpoints
  static const String getUsers = baseUrl + "/users";


}