import 'package:flutter/material.dart';

class PathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图形裁切'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //矩形
              ClipRect(
                child: Container(
                  height: 100.0,
                  color: Colors.blueAccent,
                ),
              ),
              //圆角矩形
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Container(
                  height: 100.0,
                  color: Colors.greenAccent,
                ),
              ),
              //椭圆
              ClipOval(
                child: Container(
                  height: 100.0,
                  color: Colors.redAccent,
                ),
              ),
              //自定义path
              ClipPath(
                clipper: _BezierClipper(),
                child: Container(
                  height: 200.0,
                  color: Colors.yellowAccent,
                ),
              ),
              ClipPath(
                clipper: _BezierClipperPlus(),
                child: Container(
                  height: 200.0,
                  color: Colors.deepPurpleAccent,
                ),
              )
            ],
          ),
        ));
  }
}

class _BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class _BezierClipperPlus extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 60);
    path.quadraticBezierTo(
        size.width / 4 * 3, size.height - 120, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
