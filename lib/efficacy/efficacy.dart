import 'package:flutter/material.dart';
import 'dart:ui';

///毛玻璃效果
class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //层叠布局
      body: Stack(
        children: <Widget>[
          //约束盒子组件
          ConstrainedBox(
            //约束条件   可扩展的
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1997417386,2721525418&fm=27&gp=0.jpg'),
          ),
          Center(
            //裁剪矩形
            child: ClipRect(
              child:
                  //背景过滤器
                  BackdropFilter(
                //图片过滤  设置模糊度
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                //透明度控件
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 540.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        'bilibili',
                        style: Theme.of(context).textTheme.display4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
