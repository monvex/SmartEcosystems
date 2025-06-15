// To parse this JSON data, do
//
//     final rainData = rainDataFromJson(jsonString);

import 'dart:convert';

RainData rainDataFromJson(String str) => RainData.fromJson(json.decode(str));

String rainDataToJson(RainData data) => json.encode(data.toJson());

class RainData {
  List<double> data;
  List<DateTime> labels;
  String result;

  RainData({required this.data, required this.labels, required this.result});

  factory RainData.fromJson(Map<String, dynamic> json) => RainData(
    data: List<double>.from(json["data"].map((x) => x?.toDouble())),
    labels: List<DateTime>.from(json["labels"].map((x) => DateTime.parse(x))),
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x)),
    "labels": List<dynamic>.from(
      labels.map(
        (x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}",
      ),
    ),
    "result": result,
  };
}
