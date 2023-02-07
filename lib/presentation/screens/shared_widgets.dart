import 'package:flutter/material.dart';
import 'package:lol_summonersearch/presentation/utils/timeconverter.dart';
import 'package:shimmer/shimmer.dart';

class SharedWidgets {
  Widget DetailAppBar(context, _parameter) {
    return Container(
        height: MediaQuery.of(context).size.height / 3.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  _parameter.coverImg.toString(),
                ))),
        child: Column(
          children: [
            SafeArea(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_left,
                      )),
                  IconButton(
                      onPressed: () {
                        print("clicked star");
                      },
                      icon: Icon(
                        Icons.star_border_outlined,
                        color: Colors.yellow,
                      )),
                ],
              ),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: Colors.green,
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 50,
                  ),
                )
              ]),
            ),
          ],
        ));
  }

  Widget DetailListView(
      {required win,
      required champUrl,
      required kills,
      required deaths,
      required assists,
      required gameLength,
      required item0,
      required item1,
      required item2,
      required item3,
      required item4,
      required item5}) {
    return Container(
        child: Row(
      children: [
        Container(
            height: 100,
            width: 60,
            decoration: BoxDecoration(
                color: win! ? Colors.green : Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(win ? "W" : "L"), Text("20:00")],
            )),
        Expanded(
          child: Container(
            height: 100,
            color: Color(0xff1c2023),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      color: Colors.purple,
                      child: Center(
                        child: Image.network(
                            "http://ddragon.leagueoflegends.com/cdn/13.1.1/img/champion/${champUrl}.png"),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 22,
                          width: 22,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          "$kills/$deaths/$assists",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "K/P 50%",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Text(
                              "Ranked Solo",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "${getMinuteSecond(gameLength!.toInt())}",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                //items here
                Row(
                  children: [
                    //item1
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                      child: Image.network("$item0"),
                    ),
                    sb(),
                    //item2
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                      child: Image.network("$item1"),
                    ),
                    sb(),
                    //item3
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                      child: Image.network("$item2"),
                    ),
                    sb(),
                    //item4
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                      child: Image.network("$item3"),
                    ),
                    sb(),
                    //item5
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                      child: Image.network("$item4"),
                    ),
                    sb(),
                    //item6
                    Container(
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                      child: Image.network("$item5"),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget sb() {
    return SizedBox(width: 3);
  }
}
