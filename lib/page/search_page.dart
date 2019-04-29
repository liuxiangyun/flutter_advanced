import 'package:flutter/material.dart';

///搜索
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Center(
        child: Text(
          '搜索',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
