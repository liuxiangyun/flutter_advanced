import 'package:flutter/material.dart';
import 'router/router.dart';
import 'Search.dart';

class KeepAliveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KeepAlive",
      home: KeepAliveTab(),
    );
  }
}

class KeepAliveTab extends StatefulWidget {
  @override
  _KeepAliveTabState createState() => _KeepAliveTabState();
}

/// with 混入
/// with SingleTickerProviderStateMixin : TabController的参数TickerProvider必须在SingleTickerProviderStateMixin获取
class _KeepAliveTabState extends State<KeepAliveTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<KeepAlivePage> _body;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _body = [
      KeepAlivePage("小汽车"),
      KeepAlivePage("公交车"),
      KeepAlivePage("自行车"),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keep Alive Demo"),

        ///tabBar
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_bus)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
          controller: _tabController,
        ),

        ///右边的icon
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, FadeRouter(Search()));
            },
          )
        ],
      ),
      body: TabBarView(
        children: _body,
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _body[_tabController.index].add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class KeepAlivePage extends StatefulWidget {
  final String pageTitle;
  _KeepAlivePageState _state;

  KeepAlivePage(this.pageTitle, {Key key}) : super(key: key);

  void add() {
    _state.add();
  }

  @override
  _KeepAlivePageState createState() {
    _state = _KeepAlivePageState(pageTitle);
    return _state;
  }
}

/// with 混入
/// with AutomaticKeepAliveClientMixin : TabBarView想要保存状态必须混入AutomaticKeepAliveClientMixin，重写wantKeepAlive方法，类似android
/// ViewPage保存状态
class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  String pageTitle;
  int _count;

  _KeepAlivePageState(this.pageTitle) : super();

  //保存状态
  @override
  bool get wantKeepAlive => true;

  void add() {
    setState(() {
      _count++;
    });
  }

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(pageTitle),
            Text(
              "当前点击次数:$_count",
            )
          ],
        ),
      ),
    );
  }
}
