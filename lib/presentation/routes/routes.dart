import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_summonersearch/presentation/routes/route_const.dart';
import 'package:lol_summonersearch/presentation/screens/detail_screen/detail_screen.dart';
import 'package:lol_summonersearch/presentation/screens/leaderboard/leaderboard_screen.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case detailScreen:
        return MaterialPageRoute(
          builder: (_) => DetailScreen(),
        );
      case leaderboardScreen:
        return MaterialPageRoute(
          builder: (_) => LeaderboardScreen(),
        );
      default:
        throw ('This route name does not exit');
    }
  }
}
