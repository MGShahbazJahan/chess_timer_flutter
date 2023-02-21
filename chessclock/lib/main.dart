import 'package:chessclock/prvs/ms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'screens/setting.dart';

void main() {
  // setting top root node as this provider package thing i.e"MultiProvider", cause it lets us to set and allows to listen all ways of data sharing
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Ms())],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
        '/setting': (context) => const Setting(),
      },
    ),
  ));
}
