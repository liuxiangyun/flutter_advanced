import 'package:flutter/material.dart';
import 'package:flutter_advanced/page/home_page.dart';
import 'package:flutter_advanced/page/my_page.dart';
import 'package:flutter_advanced/page/search_page.dart';
import 'package:flutter_advanced/page/contacts_page.dart';

/// 底部导航组件
class BottomNavigationWidget extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavigationWidget> {
  Color _color = Colors.blue;
  int _currentIndex = 0;
  final List<Widget> _pages = List();

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _color = Colors.blue;
    _pages
      ..add(HomePage())
      ..add(ContactsPage())
      ..add(SearchPage())
      ..add(MyPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          //刷新状态
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _color,
            ),
            title: Text(
              '首页',
              style: TextStyle(color: _color),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
                color: _color,
              ),
              title: Text(
                '朋友',
                style: TextStyle(color: _color),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _color,
              ),
              title: Text(
                '搜索',
                style: TextStyle(color: _color),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: _color,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _color),
              )),
        ],
      ),
    );
  }
}
