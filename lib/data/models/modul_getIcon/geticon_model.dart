import 'dart:convert';

GetIconResponseModel getIconResponseModelFromJson(String str) =>
    GetIconResponseModel.fromJson(json.decode(str));

String getIconResponseModelToJson(GetIconResponseModel data) =>
    json.encode(data.toJson());

class GetIconResponseModel {
  GetIconResponseModel({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.name,
    required this.profileIconId,
    required this.revisionDate,
    required this.summonerLevel,
  });

  String id;
  String accountId;
  String puuid;
  String name;
  int profileIconId;
  int revisionDate;
  int summonerLevel;

  factory GetIconResponseModel.fromJson(Map<String, dynamic> json) =>
      GetIconResponseModel(
        id: json["id"],
        accountId: json["accountId"],
        puuid: json["puuid"],
        name: json["name"],
        profileIconId: json["profileIconId"],
        revisionDate: json["revisionDate"],
        summonerLevel: json["summonerLevel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "puuid": puuid,
        "name": name,
        "profileIconId": profileIconId,
        "revisionDate": revisionDate,
        "summonerLevel": summonerLevel,
      };
}
