import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var tabController; // 先声明变量

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(
        vsync: this, // 动画效果的异步处理
        length: 4 // tab 个数
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
            Text('aaa'),
            Text('bbb'),
            Text('ccc'),
            Text('ddd'),
          ],
        ),
        // 底端栏是一个 TabBar
        bottomNavigationBar: Material(
          child: TabBar(
            indicator: const BoxDecoration(),
            labelColor: Colors.black,
            controller: this.tabController,
            labelStyle: TextStyle(color: Colors.red, fontSize: 13),
            tabs: <Tab>[
              Tab(
                text: '主页',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: '素材',
                icon: Icon(Icons.history),
              ),
              Tab(
                text: '购物车',
                icon: Icon(Icons.book),
              ),
              Tab(
                text: '我的',
                icon: Icon(Icons.book),
              ),
            ],
          ),
        ));
  }
}
