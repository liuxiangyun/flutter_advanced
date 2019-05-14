import 'package:flutter/material.dart';
import 'navigation/bottom_navigation_widget.dart';
import 'navigation/irregular_bottom_navigation_widget.dart';
import 'keep_alive.dart';
import 'package:flutter_advanced/path/path_test.dart';
import 'page/splash_screen_page.dart';

void main() => runApp(myApp());

Widget myApp() =>
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter',
//      home: BottomNavigationWidget(),
//      home: IrregularBottomNavigationWidget(),
//      home: KeepAliveWidget(),
//      home: PathWidget(),
        home: SplashScreenPage(),
    );
