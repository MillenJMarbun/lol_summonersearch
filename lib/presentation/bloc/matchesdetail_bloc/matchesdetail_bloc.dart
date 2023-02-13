import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_summonersearch/data/models/model_matches/matches_detail_model.dart';
import 'package:lol_summonersearch/data/services/api_connection.dart';
import 'package:lol_summonersearch/domain/use_cases/modul_match_history/match_history.dart';

part 'matchesdetail_event.dart';
part 'matchesdetail_state.dart';

class MatchesdetailBloc extends Bloc<MatchesdetailEvent, MatchesdetailState> {
  MatchesdetailBloc() : super(MatchesdetailInitial()) {
    on<MatchesdetailEvent>((event, emit) async {
      if (event is GetMatchesDetailEvent) {
        emit(MatchDetailLoadingState());

        List<GetMatchesResponseModel> matchDetail = [];

        for (int i = 0; i < 6; i++) {
          print("mantap sudah masuk disini matches nya: ${event.matches[i]}");
          String url =
              "https://americas.api.riotgames.com/lol/match/v5/matches/${event.matches[i]}?api_key=RGAPI-03c19eb9-d226-4951-8ef3-8ac0f37f9234";

          var response = await ApiConnection.GetMatches(url: url);

          final getMatchesResponseModel =
              getMatchesResponseModelFromJson(jsonEncode(response));

          print("printed here: $getMatchesResponseModel");
          matchDetail.add(getMatchesResponseModel);
        }
        print("here is whats inside XD!: $matchDetail");

        emit(MatchDetailSuccessState(matches: matchDetail));
      }
    });
  }
}
