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
    _body = [
      KeepAlivePage("小汽车"),
      KeepAlivePage("公交车"),
      KeepAlivePage("自行车"),
    ];
    _tabController = TabController(length: _body.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _Drawer(),
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
//        heroTag: null,
        backgroundColor: Colors.redAccent,
        tooltip: "点击累加",
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 40.0),
            child: Text(
              pageTitle,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            "当前点击次数:$_count",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(),
        margin: const EdgeInsets.all(0.0),
        elevation: 4.0,
        child: Container(
          width: 295.0,
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(
                    "http://img1d.xgo-img.com.cn/pics/1538/1537599.jpg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
