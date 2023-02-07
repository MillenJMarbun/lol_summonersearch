// To parse this JSON data, do
//
//     final leaderboardInquiryModel = leaderboardInquiryModelFromJson(jsonString);

import 'dart:convert';

import 'package:lol_summonersearch/domain/entities/modul_leaderboard/LeaderboardInquiryEntity.dart';

LeaderboardInquiryModel leaderboardInquiryModelFromJson(String str) =>
    LeaderboardInquiryModel.fromJson(json.decode(str));

String leaderboardInquiryModelToJson(LeaderboardInquiryModel data) =>
    json.encode(data.toJson());

class LeaderboardInquiryModel {
  LeaderboardInquiryModel({
    required this.tier,
    required this.leagueId,
    required this.queue,
    required this.name,
    required this.entries,
  });

  String tier;
  String leagueId;
  String queue;
  String name;
  List<Entry> entries;

  factory LeaderboardInquiryModel.fromJson(Map<String, dynamic> json) =>
      LeaderboardInquiryModel(
        tier: json["tier"],
        leagueId: json["leagueId"],
        queue: json["queue"],
        name: json["name"],
        entries:
            List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tier": tier,
        "leagueId": leagueId,
        "queue": queue,
        "name": name,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };

  LeaderboardInquiryEntity toEntity() {
    return LeaderboardInquiryEntity(
      name: this.name,
      entries: this.entries,
      leagueId: this.leagueId,
      tier: this.tier,
      queue: this.queue,
    );
  }
}

class Entry {
  Entry({
    required this.summonerId,
    required this.summonerName,
    required this.leaguePoints,
    required this.rank,
    required this.wins,
    required this.losses,
    required this.veteran,
    required this.inactive,
    required this.freshBlood,
    required this.hotStreak,
  });

  String summonerId;
  String summonerName;
  int leaguePoints;
  Rank rank;
  int wins;
  int losses;
  bool veteran;
  bool inactive;
  bool freshBlood;
  bool hotStreak;
  String icon = "";

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        summonerId: json["summonerId"],
        summonerName: json["summonerName"],
        leaguePoints: json["leaguePoints"],
        rank: rankValues.map[json["rank"]]!,
        wins: json["wins"],
        losses: json["losses"],
        veteran: json["veteran"],
        inactive: json["inactive"],
        freshBlood: json["freshBlood"],
        hotStreak: json["hotStreak"],
      );

  Map<String, dynamic> toJson() => {
        "summonerId": summonerId,
        "summonerName": summonerName,
        "leaguePoints": leaguePoints,
        "rank": rankValues.reverse[rank],
        "wins": wins,
        "losses": losses,
        "veteran": veteran,
        "inactive": inactive,
        "freshBlood": freshBlood,
        "hotStreak": hotStreak,
        "icon": icon
      };
}

enum Rank { I }

final rankValues = EnumValues({"I": Rank.I});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
