import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lol_summonersearch/data/models/modul_leaderboard/leaderboard_inquiry_model.dart';
import 'package:lol_summonersearch/data/services/api_connection.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_leaderboard/leaderboard_inquiry_parameter.dart';

abstract class LeaderboardInquiryRemoteDataSource {
  Future<LeaderboardInquiryModel> leaderboardInquiryService(
      LeaderboardInquiryParameter parameter);
}

class LeaderboardInquiryRemoteDataSourceImpl
    implements LeaderboardInquiryRemoteDataSource {
  @override
  Future<LeaderboardInquiryModel> leaderboardInquiryService(
      LeaderboardInquiryParameter parameter) async {
    Map<String, dynamic> params = {};
    try {
      var dataRes;
      await ApiConnection.postData(url: parameter.url!, params: params)
          .then((value) {
        print("result " + json.encode(value));
        dataRes = jsonDecode(value) as Map<String, dynamic>;
      });
      print("Response : " + dataRes.toString());
      if (dataRes['leagueId'] != null) {
        return LeaderboardInquiryModel.fromJson(dataRes);
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
