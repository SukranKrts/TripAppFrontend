///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CommentGetModelPayload {
/*
{
  "tripId": 0,
  "userId": 0,
  "comment": "string",
  "point": 0
} 
*/

  late int tripId;
  late int userId;
  late String comment;
  late int point;

  CommentGetModelPayload({
    required this.tripId,
    required this.userId,
    required this.comment,
    required this.point,
  });
  CommentGetModelPayload.fromJson(Map<String, dynamic> json) {
    tripId = json['tripId']?.toInt();
    userId = json['userId']?.toInt();
    comment = json['comment'].toString();
    point = json['point']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tripId'] = tripId;
    data['userId'] = userId;
    data['comment'] = comment;
    data['point'] = point;
    return data;
  }
}

class CommentGetModel {
/*
{
  "success": true,
  "information": "string",
  "payload": [
    {
      "tripId": 0,
      "userId": 0,
      "comment": "string",
      "point": 0
    }
  ]
} 
*/

  late bool success;
  late String information;
  late List<CommentGetModelPayload> payload;

  CommentGetModel({
    required this.success,
    required this.information,
    required this.payload,
  });
  CommentGetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    information = json['information'].toString();
  if (json['payload'] != null) {
  final v = json['payload'];
  final arr0 = <CommentGetModelPayload>[];
  v.forEach((v) {
  arr0.add(CommentGetModelPayload.fromJson(v));
  });
    payload = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['information'] = information;
    if (payload != null) {
      final v = payload;
      final arr0 = [];
  v.forEach((v) {
  arr0.add(v.toJson());
  });
      data['payload'] = arr0;
    }
    return data;
  }
}
