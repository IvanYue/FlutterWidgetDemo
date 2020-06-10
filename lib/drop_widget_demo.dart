import 'package:flutter/material.dart';


class DraggableWidgetDemo extends StatefulWidget {
  DraggableWidgetDemo({Key key}) : super(key: key);

  @override
  _DraggableWidgetDemoState createState() => _DraggableWidgetDemoState();
}

class _DraggableWidgetDemoState extends State<DraggableWidgetDemo> {
  Color _draggableColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('拖动效果')
      ),
       body: Stack(
         children:[
           CustomDraggableWidget(offset: Offset(80, 80),widgetColor: Colors.tealAccent,),
           CustomDraggableWidget(offset:Offset(190,80),widgetColor:Colors.redAccent),
           Center(
             child:DragTarget(
               onAccept:(Color color){
                 //接受事件
                 _draggableColor = color;
               },
               builder: (context, candidateData, rejectedData) {
                 return Container(
                   width:200,
                   height:200,
                   color: _draggableColor,
                 );
               },
             )
           )
         ]
       ),
    );
  }
}



class CustomDraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;

    CustomDraggableWidget({Key key,this.offset,this.widgetColor}) : super(key: key);

  @override
  _CustomDraggableWidgetState createState() => _CustomDraggableWidgetState();
}

class _CustomDraggableWidgetState extends State<CustomDraggableWidget> {
  
  Offset  offset = Offset(0, 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offset = widget.offset;
  }
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
       left: offset.dx,
       top: offset.dy,
       child: Draggable(
         data: widget.widgetColor,//传递的数据
         child: Container(width:100,height:100,color:widget.widgetColor), 
         feedback: Container(//拖动时候的效果
           width:100,
           height:100,
           color:Colors.yellowAccent.withOpacity(0.3)
         ),onDraggableCanceled: (velocity, offset) {
           setState(() {
             this.offset = offset;
           });
         },
         ),
    );
  }
}