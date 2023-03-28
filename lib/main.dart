import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/Screen/Fplesh/FpleshScreen.dart';
import 'package:video/Screen/Home/provider/HomeProvider.dart';
import 'package:video/Screen/Home/view/HomeScreen.dart';
import 'package:video/Screen/Video/provider/VideoProvider.dart';
import 'package:video/Screen/Video/view/VideoScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => FpleshScreen(),
          'home':(context) => HomeScreen(),
          'video':(context) => VideoScreen(),
        },
      ),
    ),
  );
}
