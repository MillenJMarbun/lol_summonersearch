import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lol_summonersearch/data/datasources/modul_match_history/match_history_remote_data_source.dart';
import 'package:lol_summonersearch/data/datasources/modul_summoner/summoner_remote_data_source.dart';
import 'package:lol_summonersearch/data/utils/network_info.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_leaderboard/LeaderboardInquiryEntity.dart';
import 'package:lol_summonersearch/domain/entities/modul_matchhistory/match_history_entity.dart';
import 'package:lol_summonersearch/domain/repositories/match_history_repository.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_matches/match_history_parameter.dart';

class MatchHistoryRepositoryimpl implements MatchHistoryRepository {
  final MatchHistoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MatchHistoryRepositoryimpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<ExceptionEntity, MatchHistoryEntity>> matchHistory(
      MatchHistoryParameter parameter) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.matchhistoryService(parameter);
        return Right(response.toEntity());
      } on ExceptionEntity catch (e) {
        return Left(e);
      } on DioError catch (e) {
        return Left(ExceptionEntity.fromDioError(e));
      }
    } else {
      return Left(ExceptionEntity(
        code: 0,
        errorMessage: 'Connection failed',
        errorDescription: 'Check your internet connection',
      ));
    }
  }
}
