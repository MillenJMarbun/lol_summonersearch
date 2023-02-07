import 'package:lol_summonersearch/data/models/modul_leaderboard/leaderboard_inquiry_model.dart';

class LeaderboardInquiryEntity {
  String tier;
  String leagueId;
  String queue;
  String name;
  List<Entry> entries;

  LeaderboardInquiryEntity({
    this.tier = "",
    this.leagueId = "",
    this.queue = "",
    this.name = "",
    this.entries = const [],
  });

  void addData(LeaderboardInquiryEntity entity) {
    this.tier = entity.tier;
    this.leagueId = entity.leagueId;
    this.queue = entity.queue;
    this.name = entity.name;
    this.entries = entity.entries;
  }
}
