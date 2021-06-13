import 'package:flutter/material.dart';

import 'package:wireframe/components/stocks.dart';

import 'Orgs.dart';
import 'SocialMedia.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ShaderMask tabItem(String text, Icon icon) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: <Color>[
            Color(0xffFBD786),
            Color(0xfff7797d),
          ],
        ).createShader(bounds);
      },
      child: Container(
        margin: EdgeInsets.only(top: 2),
        child: Column(
          children: [
            icon,
            Text(
              text,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomtab() {
    return Container(
      color: Color(0xff050A30),
      height: 50,
      child: TabBar(
        tabs: [
          Tab(icon: tabItem("Network", Icon(Icons.people))),
          Tab(icon: tabItem("Stocks", Icon(Icons.business))),
          Tab(icon: tabItem("Orgs", Icon(Icons.show_chart))),
        ],
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey.shade600,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color(0xff050A30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          centerTitle: true,
          backgroundColor: Color(0xff050A30),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            SocialMedia(),
            StocksPage(),
            Orgs(),
          ],
        ),
        bottomNavigationBar: bottomtab(),
      ),
    );
  }
}
