import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_summonersearch/data/models/model_matches/matches_detail_model.dart';
import 'package:lol_summonersearch/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchesdetail_bloc/matchesdetail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchhistory_bloc/match_history_bloc.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_global/global_parameter.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';
import 'package:lol_summonersearch/presentation/screens/shared_widgets.dart';
import 'package:lol_summonersearch/presentation/utils/region_handler.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  GetBySummonerNameParameter _parameter = GetBySummonerNameParameter();
  GlobalParameter _globalParameter = GlobalParameter();

  List<GetMatchesResponseModel>? match;
  var currSummName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            BlocBuilder<DetailBloc, DetailState>(
              builder: (context, state) {
                if (state is DetailLoadingState) {
                  return SharedWidgets().DetailAppBar(context, _parameter);
                }

                if (state is DetailSuccessState) {
                  var region = convertshortToLongRegion(state.params.region.toString());

                  currSummName = state.entity.name;
                  var url = "https://${region}.api.riotgames.com/lol/match/v5/matches/by-puuid/${state.entity.puuid}/ids?start=0&count=10&api_key=${_globalParameter.api_key}";


                  BlocProvider.of<MatchHistoryBloc>(context)
                      .add(GetMatchHistoryEvent(url: url));
                  return SharedWidgets().DetailAppBar(context, _parameter);
                }
                if (state is DetailFailedState) {
                  return Container(
                    child:
                        Text("XDDDD" /*state.entity.errorMessage.toString()*/),
                  );
                }
                return Container();
              },
            ),
            Container(
              child: BlocConsumer<MatchHistoryBloc, MatchHistoryState>(
                listener: (context, state) {
                  if (state is MatchHistorySuccessState) {
                    print("here state match list: ${state.matchesList}");
                    BlocProvider.of<MatchesdetailBloc>(context).add(
                        GetMatchesDetailEvent(
                            matches: state
                                .matchesList)); // send state.matchesList to event
                  }
                },
                builder: (context, state) {
                  return Container();
                },
              ),
            ),

            Expanded(
              child: BlocConsumer<MatchesdetailBloc, MatchesdetailState>(
                listener: (context, state) {
                  if (state is MatchDetailSuccessState) {
                    match = state.matches;
                  }
                },
                builder: (context, state) {
                  if (state is MatchDetailLoadingState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text("Loading Matches Detail..")
                      ],
                    );
                  }

                  if (state is MatchesdetailInitial) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text("Loading Matches Detail..")
                      ],
                    );
                  }

                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      itemCount: 6,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20);
                      },
                      itemBuilder: (context, index) {
                        var champUrl = match![index]
                            .info
                            .participants
                            .firstWhere((element) =>
                                element.summonerName == currSummName)
                            .championName;

                        var kills = match![index]
                            .info
                            .participants
                            .firstWhere((element) =>
                                element.summonerName == currSummName)
                            .kills;

                        var assists = match![index]
                            .info
                            .participants
                            .firstWhere((element) =>
                                element.summonerName == currSummName)
                            .assists;

                        var deaths = match![index]
                            .info
                            .participants
                            .firstWhere((element) =>
                                element.summonerName == currSummName)
                            .deaths;

                        var win = match![index]
                            .info
                            .participants
                            .firstWhere((element) =>
                                element.summonerName == currSummName)
                            .win;

                        var gameLength = match![index]
                            .info
                            .participants[index]
                            .challenges!['gameLength'];

                        var item0 =
                            "https://ddragon.leagueoflegends.com/cdn/13.1.1/img/item/${match![index].info.participants.firstWhere((element) => element.summonerName == currSummName).item0}.png";

                        var item1 =
                            "https://ddragon.leagueoflegends.com/cdn/13.1.1/img/item/${match![index].info.participants.firstWhere((element) => element.summonerName == currSummName).item1}.png";

                        var item2 =
                            "https://ddragon.leagueoflegends.com/cdn/13.1.1/img/item/${match![index].info.participants.firstWhere((element) => element.summonerName == currSummName).item2}.png";

                        var item3 =
                            "https://ddragon.leagueoflegends.com/cdn/13.1.1/img/item/${match![index].info.participants.firstWhere((element) => element.summonerName == currSummName).item3}.png";

                        var item4 =
                            "https://ddragon.leagueoflegends.com/cdn/13.1.1/img/item/${match![index].info.participants.firstWhere((element) => element.summonerName == currSummName).item4}.png";

                        var item5 =
                            "https://ddragon.leagueoflegends.com/cdn/13.1.1/img/item/${match![index].info.participants.firstWhere((element) => element.summonerName == currSummName).item5}.png";

                        return SharedWidgets().DetailListView(
                            win: win,
                            champUrl: champUrl,
                            kills: kills,
                            deaths: deaths,
                            assists: assists,
                            gameLength: gameLength,
                            item0: item0,
                            item1: item1,
                            item2: item2,
                            item3: item3,
                            item4: item4,
                            item5: item5,
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
