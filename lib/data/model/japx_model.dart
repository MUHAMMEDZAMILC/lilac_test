// To parse this JSON data, do
//
//     final japxModel = japxModelFromJson(jsonString);

import 'dart:convert';

JapxModel japxModelFromJson(String str) => JapxModel.fromJson(json.decode(str));

String japxModelToJson(JapxModel data) => json.encode(data.toJson());

class JapxModel {
    Data? data;

    JapxModel({
        this.data,
    });

    factory JapxModel.fromJson(Map<String, dynamic> json) => JapxModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    String? type;
    dynamic attributes;

    Data({
        this.type,
        this.attributes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        attributes: json["attributes"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "attributes": attributes,
    };
}
