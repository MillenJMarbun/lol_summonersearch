// To parse this JSON data, do
//
//     final getMatchesResponseModel = getMatchesResponseModelFromJson(jsonString);

import 'dart:convert';

List<String> getMatchesResponseModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String getMatchesResponseModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
