class TripModelPayload {

  late int id;
  late String tripName;
  late String tripImage;
  late int tripDays;
  late int tripPrice;

  TripModelPayload({
    required this.id,
    required this.tripName,
    required this.tripImage,
    required this.tripDays,
    required this.tripPrice,
  });
  TripModelPayload.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    tripName = json['tripName'].toString();
    tripImage = json['tripImage'].toString();
    tripDays = json['tripDays']?.toInt();
    tripPrice = json['tripPrice']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['tripName'] = tripName;
    data['tripImage'] = tripImage;
    data['tripDays'] = tripDays;
    data['tripPrice'] = tripPrice;
    return data;
  }
}

class TripModel {

  late List<TripModelPayload> payload;
  late bool success;
  late String information;

  TripModel({
    required this.payload,
    required this.success,
    required this.information,
  });
  TripModel.fromJson(Map<String, dynamic> json) {
  if (json['payload'] != null) {
  final v = json['payload'];
  final arr0 = <TripModelPayload>[];
  v.forEach((v) {
  arr0.add(TripModelPayload.fromJson(v));
  });
    payload = arr0;
    }
    success = json['success'];
    information = json['information'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (payload != null) {
      final v = payload;
      final arr0 = [];
  v.forEach((v) {
  arr0.add(v.toJson());
  });
      data['payload'] = arr0;
    }
    data['success'] = success;
    data['information'] = information;
    return data;
  }
}
