import 'package:flutter/material.dart';
import 'package:flutter_advanced/page/home_page.dart';
import 'package:flutter_advanced/page/my_page.dart';
import 'package:flutter_advanced/page/search_page.dart';
import 'package:flutter_advanced/page/contacts_page.dart';
import 'package:flutter_advanced/page/add_page.dart';
import 'package:flutter_advanced/router/router.dart';

///不规则的底部导航组件
class IrregularBottomNavigationWidget extends StatefulWidget {
  @override
  State<IrregularBottomNavigationWidget> createState() => _NavBarState();
}

class _NavBarState extends State<IrregularBottomNavigationWidget> {
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

  void _addPage(BuildContext context) {
//    Navigator.push(context, FadeRouter(AddPage()));
//    Navigator.push(context, ScaleRouter(AddPage()));
//    Navigator.push(context, RotateScaleRouter(AddPage()));
//    Navigator.push(context, RightInRightOutRouter(AddPage()));
    Navigator.push(context, BottomInBottomOutRouter(AddPage()));
  }

  Color _getColor(int index) {
    if (_currentIndex == index) {
      return Colors.blueAccent;
    } else {
      return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPage(context);
        },
        child: Icon(Icons.add),
        tooltip: '添加',
        backgroundColor: Colors.redAccent,
      ),
      //fab 在docked 的相对位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //圆形缺口矩形在docked
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: _getColor(0),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.supervisor_account,
                color: _getColor(1),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: _getColor(2),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.perm_identity,
                color: _getColor(3),
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
