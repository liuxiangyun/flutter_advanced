import 'package:flutter/material.dart';
import 'package:flutter_advanced/router/router.dart';
import 'package:flutter_advanced/navigation/bottom_navigation_widget.dart';

///闪屏页
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SplashScaffold();
  }
}

class _SplashScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _controller;

  //动画
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    //绑定动画控制器
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //进入app首页，并清除闪屏页
        Navigator.of(context).pushAndRemoveUntil(
            FadeRouter(BottomNavigationWidget()), (route) => route == null);
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        body: Center(
            child: Image.network(
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2777233881,1106483217&fm=27&gp=0.jpg',
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
