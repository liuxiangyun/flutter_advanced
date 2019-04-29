import 'package:flutter/material.dart';
import 'package:flutter_advanced/efficacy/efficacy.dart';

///添加
class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加'),
      ),
      body: Center(
          child: FrostedGlass(),
      ),
    );
  }
}
