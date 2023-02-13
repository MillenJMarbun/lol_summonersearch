import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_summonersearch/data/models/model_matches/getmatches_model.dart';
import 'package:lol_summonersearch/data/services/api_connection.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_matches/get_matches_parameter.dart';

part 'match_history_event.dart';
part 'match_history_state.dart';

class MatchHistoryBloc extends Bloc<MatchHistoryEvent, MatchHistoryState> {
  GetMatchesParameter parameter = new GetMatchesParameter();

  MatchHistoryBloc() : super(MatchHistoryInitial()) {
    on<MatchHistoryEvent>((event, emit) async {
      if (event is GetMatchHistoryEvent) {
        emit(MatchHistoryLoadingState());

        print("url matches: ${event.url}");

        try {
          final result = await ApiConnection.GetMatches(url: event.url);
          print("hello result = $result");
          //List<String> data = result;
          var data = getMatchesResponseModelFromJson(jsonEncode(result));
          print("matches data here: ${data}");

          emit(MatchHistorySuccessState(matcheslist: data));
        } catch (e) {
          emit(MatchHistoryFailedState());
        }
      }
    });
  }
}
