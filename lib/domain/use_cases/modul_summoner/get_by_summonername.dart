import 'package:dartz/dartz.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_summoner/getby_summoner_name_entity.dart';
import 'package:lol_summonersearch/domain/repositories/summoner_repository.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';

class GetBySummonerName {
  SummonerRepository repository;
  GetBySummonerName(this.repository);

  Future<Either<ExceptionEntity, GetBySummonerNameEntity>> execute(
      GetBySummonerNameParameter parameter) {
    return repository.getbySummonerName(parameter);
  }
}
