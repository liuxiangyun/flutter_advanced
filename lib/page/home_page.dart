import 'package:flutter/material.dart';

///首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Text(
          '首页',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
