import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomBeizerDemo extends StatelessWidget {
  const CustomBeizerDemo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('贝塞尔曲线'),
      ),
      body: Column(
        children:<Widget>[
          ClipPath(
              clipper: CustomCliperDemo1(),
              child: Container(height:200,color: Colors.lightBlue,),
            ),
          ClipPath(
            clipper: CustomBeizerClipper(),
            child: Container(height:200,color:Colors.redAccent),
          )
        ]
      ),
    );
  }
}

class CustomCliperDemo1 extends CustomClipper<Path> {
  
    @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);

    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-50);

    path.lineTo(size.width, size.height- 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}

class CustomBeizerClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);
    path.quadraticBezierTo(size.width/4,size.height, size.width/2.2, size.height - 30);
    path.quadraticBezierTo(size.width/4*3, size.height-90, size.width, size.height-40);
    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}