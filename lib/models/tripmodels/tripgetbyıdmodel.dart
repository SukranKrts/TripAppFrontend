class TripGetByIdPayload {

  late int id;
  late int companyId;
  late String tripName;
  late String tripImage;
  late String tripType;
  late int tripDays;
  late String tripDate;
  late int tripPrice;
  late String whereFrom;
  late String ourServices;
  late String tripDetail;

  TripGetByIdPayload({
    required this.id,
    required this.companyId,
    required this.tripName,
    required this.tripImage,
    required this.tripType,
    required this.tripDays,
    required this.tripDate,
    required this.tripPrice,
    required this.whereFrom,
    required this.ourServices,
    required this.tripDetail,
  });
  TripGetByIdPayload.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    companyId = json['companyId']?.toInt();
    tripName = json['tripName'].toString();
    tripImage = json['tripImage'].toString();
    tripType = json['tripType'].toString();
    tripDays = json['tripDays']?.toInt();
    tripDate = json['tripDate'].toString();
    tripPrice = json['tripPrice']?.toInt();
    whereFrom = json['whereFrom'].toString();
    ourServices = json['ourServices'].toString();
    tripDetail = json['tripDetail'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['companyId'] = companyId;
    data['tripName'] = tripName;
    data['tripImage'] = tripImage;
    data['tripType'] = tripType;
    data['tripDays'] = tripDays;
    data['tripDate'] = tripDate;
    data['tripPrice'] = tripPrice;
    data['whereFrom'] = whereFrom;
    data['ourServices'] = ourServices;
    data['tripDetail'] = tripDetail;
    return data;
  }
}

class TripGetById {

  late List<TripGetByIdPayload> payload;
  late bool success;
  late String information;

  TripGetById({
    required this.payload,
    required this.success,
    required this.information,
  });
  TripGetById.fromJson(Map<String, dynamic> json) {
  if (json['payload'] != null) {
  final v = json['payload'];
  final arr0 = <TripGetByIdPayload>[];
  v.forEach((v) {
  arr0.add(TripGetByIdPayload.fromJson(v));
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