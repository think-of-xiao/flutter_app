import 'package:flutter/material.dart';
import 'dart:ui'; // 使用这个库以便于调用ImageFilter widget在这个里边

/// 毛玻璃效果页
class FrostedGlassDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack( // 重叠的stack widget实现重贴
          children: <Widget>[
            ConstrainedBox( // 约束盒子组件， 添加额外的限制条件到child上
              constraints: const BoxConstraints.expand(), // 限制条件，可扩展的
              child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg"),
            ),
            Center(
              child: ClipRect( // 裁剪长方形
                child: BackdropFilter( // 背景滤镜器
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // 图片模糊过滤，横竖都设置为5.0
                  child: Opacity( // 透明控件
                      opacity: 0.5,
                      child: Container(
                        width: 500.0,
                        height: 700.0,
                        decoration: BoxDecoration(color: Colors.grey.shade200), // 盒子装饰器，设置颜色为灰色
                        child: Center(
                          child: Text(
                            "I IM FROSTED GLASS",
                            style: Theme.of(context).textTheme.display4, // 设置一个字体
                          ),
                        ),
                      ),
                  ),
                ),
              ),
            )
          ],
      ),
    );
  }
}

