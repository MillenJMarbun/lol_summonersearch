import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lol_summonersearch/data/datasources/modul_summoner/summoner_remote_data_source.dart';
import 'package:lol_summonersearch/data/utils/network_info.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_summoner/getby_summoner_name_entity.dart';
import 'package:lol_summonersearch/domain/repositories/summoner_repository.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';

class SummonerRepositoryImpl implements SummonerRepository {
  final SummonerRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SummonerRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<ExceptionEntity, GetBySummonerNameEntity>> getbySummonerName(
      GetBySummonerNameParameter parameter) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.getBySummonerNameService(parameter);
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

  @override
  Future<Either<ExceptionEntity, GetBySummonerNameEntity>> getMatchesID(
      GetBySummonerNameParameter parameter) {
    // TODO: implement getMatchesID
    throw UnimplementedError();
  }
}
