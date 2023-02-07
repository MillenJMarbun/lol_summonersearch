import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lol_summonersearch/data/models/modul_getIcon/geticon_model.dart';
import 'package:lol_summonersearch/data/services/api_connection.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_leaderboard/LeaderboardInquiryEntity.dart';
import 'package:lol_summonersearch/domain/use_cases/modul_leaderboard/leaderboard_inquiry.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_global/global_parameter.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_icon/get_icon_parameter.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_leaderboard/leaderboard_inquiry_parameter.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final LeaderBoardInquiry leaderBoardInquiry;
  GlobalParameter parameter = new GlobalParameter();
  GetIconParameter parameter2 = new GetIconParameter();

  LeaderboardBloc({required this.leaderBoardInquiry})
      : super(LeaderboardInitial()) {
    on<LeaderboardEvent>((event, emit) async {
      if (event is GetLeaderboardEvent) {
        emit(LeaderboardLoadingState());
        final result = await leaderBoardInquiry.execute(event.params);
        
        emit(result.fold((entity) {
          return LeaderboardFailedState(entity: entity);
        }, (entity) {
          entity.entries
              .sort((b, a) => a.leaguePoints.compareTo(b.leaguePoints));

          state.props.addData(entity);
          return LeaderboardSuccessState(entity: entity);
        }));
      }

      if (event is GetIconEvent) {
        emit(IconLoadingState());

        var url =
            "${parameter2.url}${state.props.entries[event.index].summonerId}?api_key=${parameter.api_key}";

        print("url icon : ${url}");

        try {
          final result = await ApiConnection.GetIcon(url: url);
          var data = GetIconResponseModel.fromJson(result);
          var link =
              "http://ddragon.leagueoflegends.com/cdn/13.1.1/img/profileicon/${data.profileIconId}.png";
          state.props.entries[event.index].icon = link;
          print("url img = $link");
          emit(IconSuccessState(index: event.index));
        } catch (e) {
          emit(IconSuccessState(index: event.index));
        }
      }
    });
  }
}
