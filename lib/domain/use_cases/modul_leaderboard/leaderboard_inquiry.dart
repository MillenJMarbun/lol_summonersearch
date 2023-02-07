import 'package:dartz/dartz.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_leaderboard/LeaderboardInquiryEntity.dart';
import 'package:lol_summonersearch/domain/entities/modul_summoner/getby_summoner_name_entity.dart';
import 'package:lol_summonersearch/domain/repositories/leaderboard_repository.dart';
import 'package:lol_summonersearch/domain/repositories/summoner_repository.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_leaderboard/leaderboard_inquiry_parameter.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';

class LeaderBoardInquiry {
  LeaderboardRepository repository;
  LeaderBoardInquiry(this.repository);

  Future<Either<ExceptionEntity, LeaderboardInquiryEntity>> execute(
      LeaderboardInquiryParameter parameter) {
    return repository.leaderboardInquiry(parameter);
  }
}
