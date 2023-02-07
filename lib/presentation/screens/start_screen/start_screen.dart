import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/leaderboard_bloc/leaderboard_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/matchhistory_bloc/match_history_bloc.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_global/global_parameter.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_leaderboard/leaderboard_inquiry_parameter.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_summoner/getby_summoner_name_parameter.dart';
import 'package:lol_summonersearch/presentation/routes/route_const.dart';
import 'package:lol_summonersearch/presentation/utils/constVars.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  GetBySummonerNameParameter _parameter = GetBySummonerNameParameter();
  LeaderboardInquiryParameter _leaderboardParam = LeaderboardInquiryParameter();
  GlobalParameter _paramglobal = GlobalParameter();
  String dropdownValue = ConstVar.regions.first;
  TextEditingController usernameField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1c2023),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    _leaderboardParam.getUrl("na1");
                    BlocProvider.of<LeaderboardBloc>(context)
                        .add(GetLeaderboardEvent(params: _leaderboardParam));
                    Navigator.pushNamed(context, leaderboardScreen);
                  },
                  icon: Icon(Icons.leaderboard_outlined),
                ),
              ),
              SizedBox(height: 90),
              Container(
                height: 200,
                child: Image.asset("assets/opggjinx.png"),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff5681fb),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        underline: SizedBox(),
                        //icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          _parameter.region = value;
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: ConstVar.regions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: usernameField,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                          ),
                          onChanged: (val) {
                            _parameter.url =
                                "https://${dropdownValue}.api.riotgames.com/lol/summoner/v4/summoners/by-name/${val}?api_key=${_paramglobal.api_key}";
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Color(0xff5681fb),
                      ),
                      onPressed: () {
                        usernameField.clear();
                        BlocProvider.of<DetailBloc>(context)
                            .add(GetBySummonerNameEvent(params: _parameter));
                        Navigator.pushNamed(context, detailScreen);
                      },
                      child: Text("Search summoner"),
                    ),
                  )),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
