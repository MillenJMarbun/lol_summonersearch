// To parse this JSON data, do
//
//     final getMatchesResponseModel = getMatchesResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:lol_summonersearch/domain/entities/modul_matchhistory/match_history_entity.dart';

GetMatchesResponseModel getMatchesResponseModelFromJson(String str) =>
    GetMatchesResponseModel.fromJson(json.decode(str));

String getMatchesResponseModelToJson(GetMatchesResponseModel data) =>
    json.encode(data.toJson());

class GetMatchesResponseModel {
  GetMatchesResponseModel({
    required this.metadata,
    required this.info,
  });

  Metadata metadata;
  Info info;

  factory GetMatchesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetMatchesResponseModel(
        metadata: Metadata.fromJson(json["metadata"]),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "info": info.toJson(),
      };
  MatchHistoryEntity toEntity() {
    return MatchHistoryEntity(info: this.info, metadata: this.metadata);
  }
}

class Info {
  Info({
    required this.gameCreation,
    required this.gameDuration,
    required this.gameEndTimestamp,
    required this.gameId,
    required this.gameMode,
    required this.gameName,
    required this.gameStartTimestamp,
    required this.gameType,
    required this.gameVersion,
    required this.mapId,
    required this.participants,
    required this.platformId,
    required this.queueId,
    required this.teams,
    required this.tournamentCode,
  });

  int gameCreation;
  int gameDuration;
  int gameEndTimestamp;
  int gameId;
  String gameMode;
  String gameName;
  int gameStartTimestamp;
  String gameType;
  String gameVersion;
  int mapId;
  List<Participant> participants;
  String platformId;
  int queueId;
  List<Team> teams;
  String tournamentCode;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        gameCreation: json["gameCreation"],
        gameDuration: json["gameDuration"],
        gameEndTimestamp: json["gameEndTimestamp"],
        gameId: json["gameId"],
        gameMode: json["gameMode"],
        gameName: json["gameName"],
        gameStartTimestamp: json["gameStartTimestamp"],
        gameType: json["gameType"],
        gameVersion: json["gameVersion"],
        mapId: json["mapId"],
        participants: List<Participant>.from(
            json["participants"].map((x) => Participant.fromJson(x))),
        platformId: json["platformId"],
        queueId: json["queueId"],
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
        tournamentCode: json["tournamentCode"],
      );

  Map<String, dynamic> toJson() => {
        "gameCreation": gameCreation,
        "gameDuration": gameDuration,
        "gameEndTimestamp": gameEndTimestamp,
        "gameId": gameId,
        "gameMode": gameMode,
        "gameName": gameName,
        "gameStartTimestamp": gameStartTimestamp,
        "gameType": gameType,
        "gameVersion": gameVersion,
        "mapId": mapId,
        "participants": List<dynamic>.from(participants.map((x) => x.toJson())),
        "platformId": platformId,
        "queueId": queueId,
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
        "tournamentCode": tournamentCode,
      };
}

class Participant {
  Participant({
    required this.allInPings,
    required this.assistMePings,
    required this.assists,
    required this.baitPings,
    required this.baronKills,
    required this.basicPings,
    required this.bountyLevel,
    required this.challenges,
    required this.champExperience,
    required this.champLevel,
    required this.championId,
    required this.championName,
    required this.championTransform,
    required this.commandPings,
    required this.consumablesPurchased,
    required this.damageDealtToBuildings,
    required this.damageDealtToObjectives,
    required this.damageDealtToTurrets,
    required this.damageSelfMitigated,
    required this.dangerPings,
    required this.deaths,
    required this.detectorWardsPlaced,
    required this.doubleKills,
    required this.dragonKills,
    required this.eligibleForProgression,
    required this.enemyMissingPings,
    required this.enemyVisionPings,
    required this.firstBloodAssist,
    required this.firstBloodKill,
    required this.firstTowerAssist,
    required this.firstTowerKill,
    required this.gameEndedInEarlySurrender,
    required this.gameEndedInSurrender,
    required this.getBackPings,
    required this.goldEarned,
    required this.goldSpent,
    required this.holdPings,
    required this.individualPosition,
    required this.inhibitorKills,
    required this.inhibitorTakedowns,
    required this.inhibitorsLost,
    required this.item0,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.item6,
    required this.itemsPurchased,
    required this.killingSprees,
    required this.kills,
    required this.lane,
    required this.largestCriticalStrike,
    required this.largestKillingSpree,
    required this.largestMultiKill,
    required this.longestTimeSpentLiving,
    required this.magicDamageDealt,
    required this.magicDamageDealtToChampions,
    required this.magicDamageTaken,
    required this.needVisionPings,
    required this.neutralMinionsKilled,
    required this.nexusKills,
    required this.nexusLost,
    required this.nexusTakedowns,
    required this.objectivesStolen,
    required this.objectivesStolenAssists,
    required this.onMyWayPings,
    required this.participantId,
    required this.pentaKills,
    required this.perks,
    required this.physicalDamageDealt,
    required this.physicalDamageDealtToChampions,
    required this.physicalDamageTaken,
    required this.profileIcon,
    required this.pushPings,
    required this.puuid,
    required this.quadraKills,
    required this.riotIdName,
    required this.riotIdTagline,
    required this.role,
    required this.sightWardsBoughtInGame,
    required this.spell1Casts,
    required this.spell2Casts,
    required this.spell3Casts,
    required this.spell4Casts,
    required this.summoner1Casts,
    required this.summoner1Id,
    required this.summoner2Casts,
    required this.summoner2Id,
    required this.summonerId,
    required this.summonerLevel,
    required this.summonerName,
    required this.teamEarlySurrendered,
    required this.teamId,
    required this.teamPosition,
    required this.timeCCingOthers,
    required this.timePlayed,
    required this.totalDamageDealt,
    required this.totalDamageDealtToChampions,
    required this.totalDamageShieldedOnTeammates,
    required this.totalDamageTaken,
    required this.totalHeal,
    required this.totalHealsOnTeammates,
    required this.totalMinionsKilled,
    required this.totalTimeCcDealt,
    required this.totalTimeSpentDead,
    required this.totalUnitsHealed,
    required this.tripleKills,
    required this.trueDamageDealt,
    required this.trueDamageDealtToChampions,
    required this.trueDamageTaken,
    required this.turretKills,
    required this.turretTakedowns,
    required this.turretsLost,
    required this.unrealKills,
    required this.visionClearedPings,
    required this.visionScore,
    required this.visionWardsBoughtInGame,
    required this.wardsKilled,
    required this.wardsPlaced,
    required this.win,
  });

  int? allInPings;
  int? assistMePings;
  int? assists;
  int? baitPings;
  int? baronKills;
  int? basicPings;
  int? bountyLevel;
  Map<String, double>? challenges;
  int? champExperience;
  int? champLevel;
  int? championId;
  String? championName;
  int? championTransform;
  int? commandPings;
  int? consumablesPurchased;
  int? damageDealtToBuildings;
  int? damageDealtToObjectives;
  int? damageDealtToTurrets;
  int? damageSelfMitigated;
  int? dangerPings;
  int? deaths;
  int? detectorWardsPlaced;
  int? doubleKills;
  int? dragonKills;
  bool? eligibleForProgression;
  int? enemyMissingPings;
  int? enemyVisionPings;
  bool? firstBloodAssist;
  bool? firstBloodKill;
  bool? firstTowerAssist;
  bool? firstTowerKill;
  bool? gameEndedInEarlySurrender;
  bool? gameEndedInSurrender;
  int? getBackPings;
  int? goldEarned;
  int? goldSpent;
  int? holdPings;
  String? individualPosition;
  int? inhibitorKills;
  int? inhibitorTakedowns;
  int? inhibitorsLost;
  int? item0;
  int? item1;
  int? item2;
  int? item3;
  int? item4;
  int? item5;
  int? item6;
  int? itemsPurchased;
  int? killingSprees;
  int? kills;
  String? lane;
  int? largestCriticalStrike;
  int? largestKillingSpree;
  int? largestMultiKill;
  int? longestTimeSpentLiving;
  int? magicDamageDealt;
  int? magicDamageDealtToChampions;
  int? magicDamageTaken;
  int? needVisionPings;
  int? neutralMinionsKilled;
  int? nexusKills;
  int? nexusLost;
  int? nexusTakedowns;
  int? objectivesStolen;
  int? objectivesStolenAssists;
  int? onMyWayPings;
  int? participantId;
  int? pentaKills;
  Perks? perks;
  int? physicalDamageDealt;
  int? physicalDamageDealtToChampions;
  int? physicalDamageTaken;
  int? profileIcon;
  int? pushPings;
  String? puuid;
  int? quadraKills;
  String? riotIdName;
  String? riotIdTagline;
  String? role;
  int? sightWardsBoughtInGame;
  int? spell1Casts;
  int? spell2Casts;
  int? spell3Casts;
  int? spell4Casts;
  int? summoner1Casts;
  int? summoner1Id;
  int? summoner2Casts;
  int? summoner2Id;
  String? summonerId;
  int? summonerLevel;
  String? summonerName;
  bool? teamEarlySurrendered;
  int? teamId;
  String? teamPosition;
  int? timeCCingOthers;
  int? timePlayed;
  int? totalDamageDealt;
  int? totalDamageDealtToChampions;
  int? totalDamageShieldedOnTeammates;
  int? totalDamageTaken;
  int? totalHeal;
  int? totalHealsOnTeammates;
  int? totalMinionsKilled;
  int? totalTimeCcDealt;
  int? totalTimeSpentDead;
  int? totalUnitsHealed;
  int? tripleKills;
  int? trueDamageDealt;
  int? trueDamageDealtToChampions;
  int? trueDamageTaken;
  int? turretKills;
  int? turretTakedowns;
  int? turretsLost;
  int? unrealKills;
  int? visionClearedPings;
  int? visionScore;
  int? visionWardsBoughtInGame;
  int? wardsKilled;
  int? wardsPlaced;
  bool? win;

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        allInPings: json["allInPings"],
        assistMePings: json["assistMePings"],
        assists: json["assists"],
        baitPings: json["baitPings"],
        baronKills: json["baronKills"],
        basicPings: json["basicPings"],
        bountyLevel: json["bountyLevel"],
        challenges: Map.from(json["challenges"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        champExperience: json["champExperience"],
        champLevel: json["champLevel"],
        championId: json["championId"],
        championName: json["championName"],
        championTransform: json["championTransform"],
        commandPings: json["commandPings"],
        consumablesPurchased: json["consumablesPurchased"],
        damageDealtToBuildings: json["damageDealtToBuildings"],
        damageDealtToObjectives: json["damageDealtToObjectives"],
        damageDealtToTurrets: json["damageDealtToTurrets"],
        damageSelfMitigated: json["damageSelfMitigated"],
        dangerPings: json["dangerPings"],
        deaths: json["deaths"],
        detectorWardsPlaced: json["detectorWardsPlaced"],
        doubleKills: json["doubleKills"],
        dragonKills: json["dragonKills"],
        eligibleForProgression: json["eligibleForProgression"],
        enemyMissingPings: json["enemyMissingPings"],
        enemyVisionPings: json["enemyVisionPings"],
        firstBloodAssist: json["firstBloodAssist"],
        firstBloodKill: json["firstBloodKill"],
        firstTowerAssist: json["firstTowerAssist"],
        firstTowerKill: json["firstTowerKill"],
        gameEndedInEarlySurrender: json["gameEndedInEarlySurrender"],
        gameEndedInSurrender: json["gameEndedInSurrender"],
        getBackPings: json["getBackPings"],
        goldEarned: json["goldEarned"],
        goldSpent: json["goldSpent"],
        holdPings: json["holdPings"],
        individualPosition: json["individualPosition"],
        inhibitorKills: json["inhibitorKills"],
        inhibitorTakedowns: json["inhibitorTakedowns"],
        inhibitorsLost: json["inhibitorsLost"],
        item0: json["item0"],
        item1: json["item1"],
        item2: json["item2"],
        item3: json["item3"],
        item4: json["item4"],
        item5: json["item5"],
        item6: json["item6"],
        itemsPurchased: json["itemsPurchased"],
        killingSprees: json["killingSprees"],
        kills: json["kills"],
        lane: json["lane"],
        largestCriticalStrike: json["largestCriticalStrike"],
        largestKillingSpree: json["largestKillingSpree"],
        largestMultiKill: json["largestMultiKill"],
        longestTimeSpentLiving: json["longestTimeSpentLiving"],
        magicDamageDealt: json["magicDamageDealt"],
        magicDamageDealtToChampions: json["magicDamageDealtToChampions"],
        magicDamageTaken: json["magicDamageTaken"],
        needVisionPings: json["needVisionPings"],
        neutralMinionsKilled: json["neutralMinionsKilled"],
        nexusKills: json["nexusKills"],
        nexusLost: json["nexusLost"],
        nexusTakedowns: json["nexusTakedowns"],
        objectivesStolen: json["objectivesStolen"],
        objectivesStolenAssists: json["objectivesStolenAssists"],
        onMyWayPings: json["onMyWayPings"],
        participantId: json["participantId"],
        pentaKills: json["pentaKills"],
        perks: Perks.fromJson(json["perks"]),
        physicalDamageDealt: json["physicalDamageDealt"],
        physicalDamageDealtToChampions: json["physicalDamageDealtToChampions"],
        physicalDamageTaken: json["physicalDamageTaken"],
        profileIcon: json["profileIcon"],
        pushPings: json["pushPings"],
        puuid: json["puuid"],
        quadraKills: json["quadraKills"],
        riotIdName: json["riotIdName"],
        riotIdTagline: json["riotIdTagline"],
        role: json["role"],
        sightWardsBoughtInGame: json["sightWardsBoughtInGame"],
        spell1Casts: json["spell1Casts"],
        spell2Casts: json["spell2Casts"],
        spell3Casts: json["spell3Casts"],
        spell4Casts: json["spell4Casts"],
        summoner1Casts: json["summoner1Casts"],
        summoner1Id: json["summoner1Id"],
        summoner2Casts: json["summoner2Casts"],
        summoner2Id: json["summoner2Id"],
        summonerId: json["summonerId"],
        summonerLevel: json["summonerLevel"],
        summonerName: json["summonerName"],
        teamEarlySurrendered: json["teamEarlySurrendered"],
        teamId: json["teamId"],
        teamPosition: json["teamPosition"],
        timeCCingOthers: json["timeCCingOthers"],
        timePlayed: json["timePlayed"],
        totalDamageDealt: json["totalDamageDealt"],
        totalDamageDealtToChampions: json["totalDamageDealtToChampions"],
        totalDamageShieldedOnTeammates: json["totalDamageShieldedOnTeammates"],
        totalDamageTaken: json["totalDamageTaken"],
        totalHeal: json["totalHeal"],
        totalHealsOnTeammates: json["totalHealsOnTeammates"],
        totalMinionsKilled: json["totalMinionsKilled"],
        totalTimeCcDealt: json["totalTimeCCDealt"],
        totalTimeSpentDead: json["totalTimeSpentDead"],
        totalUnitsHealed: json["totalUnitsHealed"],
        tripleKills: json["tripleKills"],
        trueDamageDealt: json["trueDamageDealt"],
        trueDamageDealtToChampions: json["trueDamageDealtToChampions"],
        trueDamageTaken: json["trueDamageTaken"],
        turretKills: json["turretKills"],
        turretTakedowns: json["turretTakedowns"],
        turretsLost: json["turretsLost"],
        unrealKills: json["unrealKills"],
        visionClearedPings: json["visionClearedPings"],
        visionScore: json["visionScore"],
        visionWardsBoughtInGame: json["visionWardsBoughtInGame"],
        wardsKilled: json["wardsKilled"],
        wardsPlaced: json["wardsPlaced"],
        win: json["win"],
      );

  Map<String, dynamic> toJson() => {
        "allInPings": allInPings,
        "assistMePings": assistMePings,
        "assists": assists,
        "baitPings": baitPings,
        "baronKills": baronKills,
        "basicPings": basicPings,
        "bountyLevel": bountyLevel,
        "challenges": Map.from(challenges!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "champExperience": champExperience,
        "champLevel": champLevel,
        "championId": championId,
        "championName": championName,
        "championTransform": championTransform,
        "commandPings": commandPings,
        "consumablesPurchased": consumablesPurchased,
        "damageDealtToBuildings": damageDealtToBuildings,
        "damageDealtToObjectives": damageDealtToObjectives,
        "damageDealtToTurrets": damageDealtToTurrets,
        "damageSelfMitigated": damageSelfMitigated,
        "dangerPings": dangerPings,
        "deaths": deaths,
        "detectorWardsPlaced": detectorWardsPlaced,
        "doubleKills": doubleKills,
        "dragonKills": dragonKills,
        "eligibleForProgression": eligibleForProgression,
        "enemyMissingPings": enemyMissingPings,
        "enemyVisionPings": enemyVisionPings,
        "firstBloodAssist": firstBloodAssist,
        "firstBloodKill": firstBloodKill,
        "firstTowerAssist": firstTowerAssist,
        "firstTowerKill": firstTowerKill,
        "gameEndedInEarlySurrender": gameEndedInEarlySurrender,
        "gameEndedInSurrender": gameEndedInSurrender,
        "getBackPings": getBackPings,
        "goldEarned": goldEarned,
        "goldSpent": goldSpent,
        "holdPings": holdPings,
        "individualPosition": individualPosition,
        "inhibitorKills": inhibitorKills,
        "inhibitorTakedowns": inhibitorTakedowns,
        "inhibitorsLost": inhibitorsLost,
        "item0": item0,
        "item1": item1,
        "item2": item2,
        "item3": item3,
        "item4": item4,
        "item5": item5,
        "item6": item6,
        "itemsPurchased": itemsPurchased,
        "killingSprees": killingSprees,
        "kills": kills,
        "lane": lane,
        "largestCriticalStrike": largestCriticalStrike,
        "largestKillingSpree": largestKillingSpree,
        "largestMultiKill": largestMultiKill,
        "longestTimeSpentLiving": longestTimeSpentLiving,
        "magicDamageDealt": magicDamageDealt,
        "magicDamageDealtToChampions": magicDamageDealtToChampions,
        "magicDamageTaken": magicDamageTaken,
        "needVisionPings": needVisionPings,
        "neutralMinionsKilled": neutralMinionsKilled,
        "nexusKills": nexusKills,
        "nexusLost": nexusLost,
        "nexusTakedowns": nexusTakedowns,
        "objectivesStolen": objectivesStolen,
        "objectivesStolenAssists": objectivesStolenAssists,
        "onMyWayPings": onMyWayPings,
        "participantId": participantId,
        "pentaKills": pentaKills,
        "perks": perks!.toJson(),
        "physicalDamageDealt": physicalDamageDealt,
        "physicalDamageDealtToChampions": physicalDamageDealtToChampions,
        "physicalDamageTaken": physicalDamageTaken,
        "profileIcon": profileIcon,
        "pushPings": pushPings,
        "puuid": puuid,
        "quadraKills": quadraKills,
        "riotIdName": riotIdName,
        "riotIdTagline": riotIdTagline,
        "role": role,
        "sightWardsBoughtInGame": sightWardsBoughtInGame,
        "spell1Casts": spell1Casts,
        "spell2Casts": spell2Casts,
        "spell3Casts": spell3Casts,
        "spell4Casts": spell4Casts,
        "summoner1Casts": summoner1Casts,
        "summoner1Id": summoner1Id,
        "summoner2Casts": summoner2Casts,
        "summoner2Id": summoner2Id,
        "summonerId": summonerId,
        "summonerLevel": summonerLevel,
        "summonerName": summonerName,
        "teamEarlySurrendered": teamEarlySurrendered,
        "teamId": teamId,
        "teamPosition": teamPosition,
        "timeCCingOthers": timeCCingOthers,
        "timePlayed": timePlayed,
        "totalDamageDealt": totalDamageDealt,
        "totalDamageDealtToChampions": totalDamageDealtToChampions,
        "totalDamageShieldedOnTeammates": totalDamageShieldedOnTeammates,
        "totalDamageTaken": totalDamageTaken,
        "totalHeal": totalHeal,
        "totalHealsOnTeammates": totalHealsOnTeammates,
        "totalMinionsKilled": totalMinionsKilled,
        "totalTimeCCDealt": totalTimeCcDealt,
        "totalTimeSpentDead": totalTimeSpentDead,
        "totalUnitsHealed": totalUnitsHealed,
        "tripleKills": tripleKills,
        "trueDamageDealt": trueDamageDealt,
        "trueDamageDealtToChampions": trueDamageDealtToChampions,
        "trueDamageTaken": trueDamageTaken,
        "turretKills": turretKills,
        "turretTakedowns": turretTakedowns,
        "turretsLost": turretsLost,
        "unrealKills": unrealKills,
        "visionClearedPings": visionClearedPings,
        "visionScore": visionScore,
        "visionWardsBoughtInGame": visionWardsBoughtInGame,
        "wardsKilled": wardsKilled,
        "wardsPlaced": wardsPlaced,
        "win": win,
      };
}

class Perks {
  Perks({
    required this.statPerks,
    required this.styles,
  });

  StatPerks statPerks;
  List<Style> styles;

  factory Perks.fromJson(Map<String, dynamic> json) => Perks(
        statPerks: StatPerks.fromJson(json["statPerks"]),
        styles: List<Style>.from(json["styles"].map((x) => Style.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statPerks": statPerks.toJson(),
        "styles": List<dynamic>.from(styles.map((x) => x.toJson())),
      };
}

class StatPerks {
  StatPerks({
    required this.defense,
    required this.flex,
    required this.offense,
  });

  int defense;
  int flex;
  int offense;

  factory StatPerks.fromJson(Map<String, dynamic> json) => StatPerks(
        defense: json["defense"],
        flex: json["flex"],
        offense: json["offense"],
      );

  Map<String, dynamic> toJson() => {
        "defense": defense,
        "flex": flex,
        "offense": offense,
      };
}

class Style {
  Style({
    required this.description,
    required this.selections,
    required this.style,
  });

  Description description;
  List<Selection> selections;
  int style;

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        description: descriptionValues.map[json["description"]]!,
        selections: List<Selection>.from(
            json["selections"].map((x) => Selection.fromJson(x))),
        style: json["style"],
      );

  Map<String, dynamic> toJson() => {
        "description": descriptionValues.reverse[description],
        "selections": List<dynamic>.from(selections.map((x) => x.toJson())),
        "style": style,
      };
}

enum Description { PRIMARY_STYLE, SUB_STYLE }

final descriptionValues = EnumValues({
  "primaryStyle": Description.PRIMARY_STYLE,
  "subStyle": Description.SUB_STYLE
});

class Selection {
  Selection({
    required this.perk,
    required this.var1,
    required this.var2,
    required this.var3,
  });

  int perk;
  int var1;
  int var2;
  int var3;

  factory Selection.fromJson(Map<String, dynamic> json) => Selection(
        perk: json["perk"],
        var1: json["var1"],
        var2: json["var2"],
        var3: json["var3"],
      );

  Map<String, dynamic> toJson() => {
        "perk": perk,
        "var1": var1,
        "var2": var2,
        "var3": var3,
      };
}

class Team {
  Team({
    required this.bans,
    required this.objectives,
    required this.teamId,
    required this.win,
  });

  List<Ban> bans;
  Objectives objectives;
  int teamId;
  bool win;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        bans: List<Ban>.from(json["bans"].map((x) => Ban.fromJson(x))),
        objectives: Objectives.fromJson(json["objectives"]),
        teamId: json["teamId"],
        win: json["win"],
      );

  Map<String, dynamic> toJson() => {
        "bans": List<dynamic>.from(bans.map((x) => x.toJson())),
        "objectives": objectives.toJson(),
        "teamId": teamId,
        "win": win,
      };
}

class Ban {
  Ban({
    required this.championId,
    required this.pickTurn,
  });

  int championId;
  int pickTurn;

  factory Ban.fromJson(Map<String, dynamic> json) => Ban(
        championId: json["championId"],
        pickTurn: json["pickTurn"],
      );

  Map<String, dynamic> toJson() => {
        "championId": championId,
        "pickTurn": pickTurn,
      };
}

class Objectives {
  Objectives({
    required this.baron,
    required this.champion,
    required this.dragon,
    required this.inhibitor,
    required this.riftHerald,
    required this.tower,
  });

  Baron baron;
  Baron champion;
  Baron dragon;
  Baron inhibitor;
  Baron riftHerald;
  Baron tower;

  factory Objectives.fromJson(Map<String, dynamic> json) => Objectives(
        baron: Baron.fromJson(json["baron"]),
        champion: Baron.fromJson(json["champion"]),
        dragon: Baron.fromJson(json["dragon"]),
        inhibitor: Baron.fromJson(json["inhibitor"]),
        riftHerald: Baron.fromJson(json["riftHerald"]),
        tower: Baron.fromJson(json["tower"]),
      );

  Map<String, dynamic> toJson() => {
        "baron": baron.toJson(),
        "champion": champion.toJson(),
        "dragon": dragon.toJson(),
        "inhibitor": inhibitor.toJson(),
        "riftHerald": riftHerald.toJson(),
        "tower": tower.toJson(),
      };
}

class Baron {
  Baron({
    required this.first,
    required this.kills,
  });

  bool first;
  int kills;

  factory Baron.fromJson(Map<String, dynamic> json) => Baron(
        first: json["first"],
        kills: json["kills"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "kills": kills,
      };
}

class Metadata {
  Metadata({
    required this.dataVersion,
    required this.matchId,
    required this.participants,
  });

  String dataVersion;
  String matchId;
  List<String> participants;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        dataVersion: json["dataVersion"],
        matchId: json["matchId"],
        participants: List<String>.from(json["participants"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "dataVersion": dataVersion,
        "matchId": matchId,
        "participants": List<dynamic>.from(participants.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
