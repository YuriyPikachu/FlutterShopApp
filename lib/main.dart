import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';

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

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
            new ListView(children: _getListData()),
            Text('bbb'),
            Text('ccc'),
            Text('ddd'),
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

  _getListData() {
    List<Widget> widgets = [];
    widgets.add(Myexample());
    for (int i = 1; i < 100; i++) {
      widgets.add(new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row $i")));
    }
    return widgets;
  }

}

class Myexample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyexampleState();
  }
}

class _MyexampleState extends State<Myexample> {
  @override
  void initState() {
    bannerList.add(
        "http:\/\/minimg.hexun.com\/i4.hexunimg.cn\/mobile_show\/image\/20190701\/20190701121331_376_621x310.jpg");
    bannerList.add(
        "http:\/\/minimg.hexun.com\/i7.hexun.com\/2015-11-16\/180596378_c324x234.jpg");
    bannerList.add(
        "http:\/\/minimg.hexun.com\/i6.hexun.com\/2014-11-19\/170564509_c324x234.jpg");
    bannerList.add(
        "http:\/\/minimg.hexun.com\/i7.hexun.com\/2014-09-02\/168105362_c324x234.jpg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getList();
  }

  List<String> bannerList = new List();

  Widget getList() {
    return BannerSwiper(
      //width  和 height 是图片的高宽比  不用传具体的高宽   必传
      height: 108,
      width: 54,
      //轮播图数目 必传
      length: 4,
      //轮播的item  widget 必传
      getwidget: (index) {
        return new GestureDetector(
            child: Image.network(
              bannerList[index % bannerList.length],
              fit: BoxFit.cover,
            ),
            onTap: () {
              //点击后todo
            });
      },
    );
  }
}
