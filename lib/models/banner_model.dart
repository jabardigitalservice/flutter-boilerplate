import 'package:flutter/foundation.dart';

class BannerModel {
  final int id;
  final String imageUrl;
  final String actionUrl;

  BannerModel({
    @required this.id,
    @required this.imageUrl,
    @required this.actionUrl
  }):assert(id != null);

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    imageUrl: json["image_url"] ?? '',
    actionUrl: json["action_url"] ?? ''
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl ?? '',
    "action_url": actionUrl ?? ''
  };
}