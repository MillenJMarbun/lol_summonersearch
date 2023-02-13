import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_summonersearch/data/models/model_matches/matches_detail_model.dart';
import 'package:lol_summonersearch/data/services/api_connection.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_matchhistory/match_history_entity.dart';
import 'package:lol_summonersearch/domain/use_cases/modul_match_history/match_history.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_matches/match_history_parameter.dart';

part 'matchesdetail_event.dart';
part 'matchesdetail_state.dart';

class MatchesdetailBloc extends Bloc<MatchesdetailEvent, MatchesdetailState> {
  final MatchHistory matchHistory;

  MatchesdetailBloc({required this.matchHistory})
      : super(MatchesdetailInitial()) {
    on<MatchesdetailEvent>((event, emit) async {
      if (event is GetMatchesDetailEvent) {
        emit(MatchDetailLoadingState());

        List<MatchHistoryEntity> matchDetail = [];
        for (int i = 0; i < 6; i++) {
          print("mantap sudah masuk disini matches nya: ${event.matches[i]}");
          String url =
              "https://americas.api.riotgames.com/lol/match/v5/matches/${event.matches[i]}?api_key=RGAPI-03c19eb9-d226-4951-8ef3-8ac0f37f9234";

          event.param.url = url;

          var result = await matchHistory.execute(event.param);

          emit(result.fold((entity) {
            print("Detail Failed");
            return MatchDetailFailState(entity: entity);
          }, (entity) {
            print("Detail Success");
            print(entity);
            matchDetail.add(entity);
            return MatchDetailLoadingState();
          }));
        }
        emit(MatchDetailSuccessState(entity: matchDetail));
      }
    });
  }
}
