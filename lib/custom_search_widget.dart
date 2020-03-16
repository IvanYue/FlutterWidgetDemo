import 'package:flutter/material.dart';

const searchList = ['jiejie-dachang腿', 'jiejie-水蛇腰', 'gege-帅气欧巴', 'gege-小鲜肉'];
const recentSuggest = ['推荐1', '推荐2'];

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('自定义搜索'),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //搜索
              showSearch(context: context, delegate: customSearchBarDelegate()) ;
            })
      ],
    ));
  }
}

/**
 * 自定义搜索
 * 需要继承 SearchDelegate
 * 必须实现 
 * 搜索query的类型为String
 */
class customSearchBarDelegate extends SearchDelegate<String> {

  @override //自定义搜索界面的主题样式
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override //搜索框左侧的按钮，一般设置为返回，这里返回一个具有动态效果的返回按钮
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () =>close(context, null));
  }

  @override //搜索框右边的图标按钮
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override //显示为搜索内容区域的建议内容
  Widget buildSuggestions(BuildContext context) {

    final suggesList = query.isEmpty 
    ? recentSuggest 
    : searchList.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggesList.length,
      itemBuilder: (context,index)=>ListTile(
        title: RichText(
            text: TextSpan(//词条匹配到的字
              text: suggesList[index].substring(0,query.length),
              style: TextStyle(color:Colors.red),
              children: [
                TextSpan(
                  text:suggesList[index].substring(query.length),
                  style: TextStyle(color:Colors.green.shade200)
                )
              ]
            ),
          ),
          onTap:() {//点击赋值
            query = suggesList[index];
            showResults(context);
          },
      )
      );
  }
  @override//点击搜索结果
  Widget buildResults(BuildContext context) {
    return new Container(
      //宽度
      width: 100,
      //高度
      height: 100,
      child: Card(
        color:Colors.redAccent,
        child: Center(child: Text(query),),
      ),
    );
  }
}
