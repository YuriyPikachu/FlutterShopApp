import 'package:flutter/material.dart';
import 'package:flutterapp/main/HomeBanner.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  var tabController; // 先声明变量

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(
        vsync: this, // 动画效果的异步处理
        length: 2 // tab 个数
    );
  }

  // 当整个页面 dispose 时，记得把控制器也 dispose 掉，释放内存
  @override
  void dispose() {
    this.tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: this.tabController, //配置控制器
          children: [
            // Tab 内容
            new ListView(children: _getListData()),
            Text('bbb'),
          ],
        ),
        // 底端栏是一个 TabBar
        bottomNavigationBar: Material(
          elevation: 3,
          child: TabBar(
            indicator: const BoxDecoration(),
            labelColor: Colors.black,
            controller: this.tabController,
            labelStyle: TextStyle(color: Colors.red, fontSize: 13),
            tabs: <Tab>[
              Tab(
                text: '发现',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: '我的',
                icon: Icon(Icons.history),
              ),
            ],
          ),
        ));
  }

  _getListData() {
    List<Widget> widgets = [];
//    widgets.add(Text("搜索你感兴趣的人"));
    widgets.add(HomeBanner());
    for (int i = 1; i < 100; i++) {
      widgets.add(new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row $i")));
    }
    return widgets;
  }

}
