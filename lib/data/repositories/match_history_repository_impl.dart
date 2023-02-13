import 'package:dartz/dartz.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_leaderboard/LeaderboardInquiryEntity.dart';
import 'package:lol_summonersearch/domain/entities/modul_matchhistory/match_history_entity.dart';
import 'package:lol_summonersearch/domain/repositories/match_history_repository.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_matches/match_history_parameter.dart';

abstract class MatchHistoryRepositoryimpl implements MatchHistoryRepository {
  Future<Either<ExceptionEntity, MatchHistoryEntity>> matchHistory(
      MatchHistoryParameter parameter);
}
