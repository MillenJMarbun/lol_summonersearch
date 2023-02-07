import 'package:dio/dio.dart';
import 'package:lol_summonersearch/data/models/modul_summoner/getby_summoner_name_model.dart';
import 'package:lol_summonersearch/data/services/api_connection.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';
import 'dart:convert';

abstract class SummonerRemoteDataSource {
  Future<GetBySummonerNameModel> getBySummonerNameService(
      GetBySummonerNameParameter parameter);
}

class SummonerRemoteDataSourceImpl implements SummonerRemoteDataSource {
  @override
  Future<GetBySummonerNameModel> getBySummonerNameService(
      GetBySummonerNameParameter parameter) async {
    Map<String, dynamic> params = {};
    try {
      var dataRes;
      await ApiConnection.postData(url: parameter.url!, params: params)
          .then((value) {
        print("result " + json.encode(value));
        dataRes = jsonDecode(value) as Map<String, dynamic>;
      });
      print("Response : " + dataRes.toString());
      if (dataRes['id'] != null) {
        return GetBySummonerNameModel.fromJson(dataRes);
      } else {
        throw (ExceptionEntity.fromFAILContent(dataRes));
      }
    } on ExceptionEntity catch (e) {
      throw (e);
    } on DioError catch (e) {
      throw (e);
    }
  }
}
