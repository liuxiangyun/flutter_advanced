import 'package:flutter/material.dart';

///我
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Text(
          '我的',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
