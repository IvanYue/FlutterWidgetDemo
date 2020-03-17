import 'package:flutter/material.dart';

class ExpansionListDemo extends StatefulWidget {
  ExpansionListDemo({Key key}) : super(key: key);

  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionListDemo> {

  List<ExpansionBean> _expansionList=[];

  @override
  void initState() {
    for (var i = 0; i < 20; i++) {
      _expansionList.add(ExpansionBean(i,false));
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('开闭控件')),
        body: Container(
          color: Colors.lightBlue,
          child: SingleChildScrollView(
            child:ExpansionPanelList(
              children: _expansionList.map((e){
                return ExpansionPanel(
                  headerBuilder: (context,bol){
                    return ListTile(
                      title: Text('Title is ${e.index}'),
                    );
                  }, 
                  body: ListTile(title: Text('Detail is ${e.index}'),),
                  isExpanded: e.isExpansion,//控制开合
                );
              }).toList(),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _expansionList.forEach((e){
                    if(e.index == panelIndex){
                      e.isExpansion = !isExpanded;
                    }
                  });
                });
              },
              // animationDuration: ,
              )
          ),
        ));
  }
}


class ExpansionBean{
  var index;//下标
  var isExpansion;//控制开合
  ExpansionBean(this.index,this.isExpansion);
}