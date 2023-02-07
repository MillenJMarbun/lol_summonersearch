import 'package:flutter/material.dart';
import 'package:lol_summonersearch/presentation/routes/routes.dart';
import 'package:lol_summonersearch/presentation/screens/start_screen/start_screen.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      onGenerateRoute: Routes().onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
