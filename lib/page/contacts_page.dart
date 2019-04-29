import 'package:flutter/material.dart';

///朋友
class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('朋友'),
      ),
      body: Center(
        child: Text(
          '朋友',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
