import 'package:flutter/material.dart';
import 'navigation/bottom_navigation_widget.dart';
import 'navigation/irregular_bottom_navigation_widget.dart';
import 'keep_alive.dart';

void main() => runApp(myApp());

Widget myApp() => MaterialApp(
      title: 'flutter',
//      home: BottomNavigationWidget(),
//      home: IrregularBottomNavigationWidget(),
      home: KeepAliveWidget(),
    );
