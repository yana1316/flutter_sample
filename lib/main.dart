import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'package:fluttercomponent/home_tab.dart';
import 'package:fluttercomponent/chat_tab.dart';
import 'package:fluttercomponent/news_tab.dart';
import 'package:fluttercomponent/settings_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LINE',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'メッセージアプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int selectedIndex = 0;
  final _pageOptions = [
    HomeTab(),
    ChatTab(),
    NewsTab(),
    SettingsTab(),
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: _pageOptions[selectedIndex],
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.green.shade600,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.grey.shade600,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState((){
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'ホーム',
          ),
          FFNavigationBarItem(
            iconData: Icons.sms,
            label: 'トーク',
          ),
          FFNavigationBarItem(
            iconData: Icons.subject,
            label: 'ニュース',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: '設定',
          ),
        ],
      ),
    );
  }
}
