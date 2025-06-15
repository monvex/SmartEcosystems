// To parse this JSON data, do
//
//     final windRoseData = windRoseDataFromJson(jsonString);

import 'dart:convert';

WindRoseData windRoseDataFromJson(String str) =>
    WindRoseData.fromJson(json.decode(str));

String windRoseDataToJson(WindRoseData data) => json.encode(data.toJson());

class WindRoseData {
  List<int> data;
  String result;

  WindRoseData({required this.data, required this.result});

  factory WindRoseData.fromJson(Map<String, dynamic> json) => WindRoseData(
    data: List<int>.from(json["data"].map((x) => x)),
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x)),
    "result": result,
  };
}
