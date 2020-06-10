import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
class FrostClassWidget extends StatefulWidget {
  FrostClassWidget({Key key}) : super(key: key);

  @override
  _FrostClassWidgetState createState() => _FrostClassWidgetState();
}

class _FrostClassWidgetState extends State<FrostClassWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('毛玻璃')
      ),
      backgroundColor: Colors.amber,
      body: Stack(//重叠的Stack Widget,实现重贴
        children:<Widget>[
          ConstrainedBox(
            constraints:const BoxConstraints.expand(),
            child:Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584353900470&di=8273bf9365f1896c99de05abd1d0e977&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fd009b3de9c82d1587e249850820a19d8bd3e42a9.jpg')
          ),
          Center(
            child: ClipRect(//可裁剪矩形
              child: BackdropFilter(//背景滤镜，给父元素添加滤镜
                  filter: ImageFilter.blur(sigmaX: 3.0,sigmaY: 3.0),//dart:ui 中的图片滤镜组件
                child: Opacity(
                    opacity: 0.5,//盖层透明度
                  child: Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(//盒子装饰器，进行装饰，设置颜色为灰色
                      color: Colors.grey.shade400
                    ),
                    child: Center(
                      child: Text(
                          '毛玻璃',
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),

                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}