import 'dart:convert';
import 'package:lol_summonersearch/domain/entities/modul_summoner/getby_summoner_name_entity.dart';

GetBySummonerNameModel? getBySummonerNameModelFromJson(String str) =>
    GetBySummonerNameModel.fromJson(json.decode(str));

String getBySummonerNameModelToJson(GetBySummonerNameModel? data) =>
    json.encode(data!.toJson());

class GetBySummonerNameModel {
  GetBySummonerNameModel({
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

  factory GetBySummonerNameModel.fromJson(Map<String, dynamic> json) =>
      GetBySummonerNameModel(
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

  GetBySummonerNameEntity toEntity() {
    return GetBySummonerNameEntity(
      name: this.name,
      accountId: this.accountId,
      id: this.id,
      profileIconId: this.profileIconId,
      puuid: this.puuid,
      revisionDate: this.revisionDate,
      summonerLevel: this.summonerLevel,
    );
  }
}
