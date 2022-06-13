// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    this.name,
    this.identitycard,
    this.age,
    this.bmi,
    this.glucouse,
    this.insuline,
    this.homa,
    this.leptin,
    this.adiponcetin,
    this.resistiin,
    this.mcp,
    this.classification,
  });

  String name;
  int identitycard;
  int age;
  double bmi;
  double glucouse;
  double insuline;
  double homa;
  double leptin;
  double adiponcetin;
  double resistiin;
  double mcp;
  String classification;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    name: json["name"],
    identitycard: json["identitycard"],
    age: json["age"],
    bmi: json["bmi"],
    glucouse: json["glucouse"],
    insuline: json["insuline"],
    homa: json["homa"],
    leptin: json["leptin"],
    adiponcetin: json["adiponcetin"],
    resistiin: json["resistiin"],
    mcp: json["mcp"],
    classification: json["classification"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "identitycard": identitycard,
    "age": age,
    "bmi": bmi,
    "glucouse": glucouse,
    "insuline": insuline,
    "homa": homa,
    "leptin": leptin,
    "adiponcetin": adiponcetin,
    "resistiin": resistiin,
    "mcp": mcp,
    "classification": classification,
  };
}
