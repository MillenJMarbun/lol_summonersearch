import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lol_summonersearch/data/datasources/modul_leaderboard/lederboard_remote_data_source.dart';
import 'package:lol_summonersearch/data/utils/network_info.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_leaderboard/LeaderboardInquiryEntity.dart';
import 'package:lol_summonersearch/domain/repositories/leaderboard_repository.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_leaderboard/leaderboard_inquiry_parameter.dart';

class LeaderboardRepositoryImpl implements LeaderboardRepository {
  final LeaderboardInquiryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LeaderboardRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<ExceptionEntity, LeaderboardInquiryEntity>> leaderboardInquiry(
      LeaderboardInquiryParameter parameter) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.leaderboardInquiryService(parameter);
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
