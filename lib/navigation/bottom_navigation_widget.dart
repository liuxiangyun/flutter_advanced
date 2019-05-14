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
  int _currentIndex = 0;
  final List<Widget> _pages = List();

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
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
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
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
            ),
            title: Text(
              '首页',
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
              ),
              title: Text(
                '朋友',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Text(
                '搜索',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
              ),
              title: Text(
                '我的',
              )),
        ],
      ),
    );
  }
}
