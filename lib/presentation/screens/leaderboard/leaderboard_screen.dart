import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_summonersearch/presentation/bloc/leaderboard_bloc/leaderboard_bloc.dart';
import 'package:lol_summonersearch/presentation/parameters/modul_leaderboard/leaderboard_inquiry_parameter.dart';
import 'package:lol_summonersearch/presentation/utils/constVars.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String dropdownValue = ConstVar.regions.first;
  LeaderboardInquiryParameter _leaderboardParam = LeaderboardInquiryParameter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2023),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Leaderboard",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xff5681fb),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            underline: SizedBox(),
                            //icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(color: Colors.white),
                            onChanged: (String? value) {
                              _leaderboardParam.getUrl(value!);

                              setState(() {
                                dropdownValue = value;
                              });

                              print(_leaderboardParam.url);

                              BlocProvider.of<LeaderboardBloc>(context).add(
                                  GetLeaderboardEvent(
                                      params: _leaderboardParam));
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: Color(0xff262b31),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(flex: 5, child: Text("Summoner Name")),
                Expanded(flex: 1, child: Text("Tier")),
                Expanded(flex: 1, child: Text("LP")),
                Expanded(flex: 1, child: Text("Win %")),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<LeaderboardBloc, LeaderboardState>(
              listener: (context, state) {
                if (state is LeaderboardSuccessState) {
                  print("hello");
                  BlocProvider.of<LeaderboardBloc>(context)
                      .add(GetIconEvent(index: 0));
                }

                if (state is LeaderboardLoadingState) {
                  DialogHandler.showCustomDialog(context);
                }

                if (state is IconSuccessState) {
                  if ((state.props.entries.length - 1) != state.index) {
                    var index = state.index + 1;
                    BlocProvider.of<LeaderboardBloc>(context)
                        .add(GetIconEvent(index: index));
                  }
                }
              },
              builder: (context, state) {
                /*if (state is IconLoadingState) {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Loading Icons")
                      ],
                    ),
                  );
                }

                if (state is IconSuccessState) {
                  return Center(
                    child: Text("everything loaded"),
                  );
                }

                if (state is LeaderboardLoadingState) {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Loading Leaderboard")
                      ],
                    ),
                  );
                }

                if (state is LeaderboardFailedState) {
                  return Container(
                    child: Text(state.entity.errorMessage.toString()),
                  );
                }*/
                return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: state.props.entries.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                    );
                  },
                  itemBuilder: (context, index) {
                    var winrate = (state.props.entries[index].wins /
                            (state.props.entries[index].wins +
                                state.props.entries[index].losses)) *
                        100;

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    height: 20,
                                    imageUrl: state.props.entries[index].icon,
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                    placeholder: (context, url) =>
                                        new CircularProgressIndicator(),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("#${index}"),
                                      Text(state
                                          .props.entries[index].summonerName),
                                    ],
                                  ),
                                ],
                              )),
                          Expanded(flex: 1, child: Text("C1")),
                          Expanded(
                              flex: 1,
                              child: Text(state
                                  .props.entries[index].leaguePoints
                                  .toString())),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${winrate.toStringAsFixed(0)}%",
                              style: TextStyle(
                                  color:
                                      winrate > 60 ? Colors.red : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DialogHandler {
  static void showCustomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Server switched"),
            actions: <Widget>[
              ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  static void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
