import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
          fillColor: Color.fromARGB(66, 66, 66, 1),
          filled: true,
          hintText: "搜索你感兴趣的人",
          prefixIcon: Icon(Icons.search),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      maxLines: 1,
      style: TextStyle(fontSize: 14, color: Color.fromARGB(153, 153, 153, 1)),
      onChanged: (text) {
        //内容改变的回调
        print('change $text');
      },
      onSubmitted: (text) {
        //内容提交(按回车)的回调
        print('submit $text');
      },
    );
  }
}
