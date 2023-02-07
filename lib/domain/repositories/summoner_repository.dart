import 'package:dartz/dartz.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_summoner/getby_summoner_name_entity.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';

abstract class SummonerRepository {
  Future<Either<ExceptionEntity, GetBySummonerNameEntity>> getbySummonerName(
      GetBySummonerNameParameter parameter);

  Future<Either<ExceptionEntity, GetBySummonerNameEntity>> getMatchesID(
      GetBySummonerNameParameter parameter);
}
