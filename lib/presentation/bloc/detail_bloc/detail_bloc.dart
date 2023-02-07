import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_summonersearch/domain/entities/modul_global/exception_entity.dart';
import 'package:lol_summonersearch/domain/entities/modul_summoner/getby_summoner_name_entity.dart';
import 'package:lol_summonersearch/domain/use_cases/modul_summoner/get_by_summonername.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetBySummonerName getBySummonerName;

  DetailBloc({required this.getBySummonerName}) : super(DetailInitial()) {
    on<DetailEvent>((event, emit) async {
      if (event is GetBySummonerNameEvent) {
        emit(DetailLoadingState());
        final result = await getBySummonerName.execute(event.params);

        /*result.fold((fail) {

        }, (entity) async {
          final result2 = await getBySummonerName.execute(entity);
        });*/

        emit(result.fold((entity) {
          return DetailFailedState(entity: entity);
        }, (entity) {
          return DetailSuccessState(entity: entity, params: event.params);
        }));
      }
    });
  }
}
