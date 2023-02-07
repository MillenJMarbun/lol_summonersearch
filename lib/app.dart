import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_summonersearch/app_view.dart';
import 'package:lol_summonersearch/injection_container.dart';
import 'package:lol_summonersearch/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/leaderboard_bloc/leaderboard_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchesdetail_bloc/matchesdetail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchhistory_bloc/match_history_bloc.dart';
import 'package:lol_summonersearch/presentation/routes/routes.dart';
import 'package:lol_summonersearch/presentation/screens/start_screen/start_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final detailBloc = sl<DetailBloc>();
  final leaderboardBloc = sl<LeaderboardBloc>();
  final matchHistoryBloc = sl<MatchHistoryBloc>();
  final matchdetailBloc = sl<MatchesdetailBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => detailBloc,
        ),
        BlocProvider(
          create: (_) => leaderboardBloc,
        ),
        BlocProvider(
          create: (_) => matchHistoryBloc,
        ),
        BlocProvider(
          create: (_) => matchdetailBloc,
        ),
      ],
      child: AppView(),
    );
  }
}
