import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:html/dom.dart' as dom;
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  final String url = "https://news.yahoo.co.jp/pickup/computer/rss.xml";
  final String title;
  List<Widget> _items = <Widget>[];
  _NewsTabState({
    @required this.title
  }){ getItems(); }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: (_items==null||_items.length==0)? Text("Loading..."): ListView(
        children: _items,
      ),
    );
  }

  void getItems() async {
    List<Widget> list = <Widget>[];
    Response res = await get(url);
    RssFeed feed = RssFeed.parse(res.body);
    for (RssItem item in feed.items) {
      list.add(ListTile(
        title: Text(item.title, style: TextStyle(fontSize: 18.0)),
        subtitle: Text(item.pubDate),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ItemDetailsPage(
                item: item, title: title, url:url
              ),
            ),
          );
        },
      ));
    }
    setState(() {
      _items = list;
    });
  }
}

class ItemDetailsPage extends StatefulWidget {
  final String title;
  final String url;
  final RssItem item;

  ItemDetailsPage({
    @required this.item,
    @required this.title,
    @required this.url,
  });

  @override
  _ItemDetails createState() => _ItemDetails(item:item);
}

class _ItemDetails extends State<ItemDetailsPage> {
  RssItem item;
  Widget _widget = Text('Loading...',);
  _ItemDetails({@required this.item});
  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: _widget,
    );
  }

  void getItem() async {
    Response res = await get(item.link);
    dom.Document doc = dom.Document.html(res.body);
    dom.Element hbody = doc.querySelector('.pickupMain_articleSummary');
    dom.Element htitle = doc.querySelector('.pickupMain_articleTitle');
    dom.Element newslink = doc.querySelector('.pickupMain_detailLink > a');
    print(newslink.attributes['href']);
    setState(() {
      _widget = SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(htitle.text, style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(hbody.text, style:TextStyle(fontSize: 20.0)),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text('続きを読む...', style:TextStyle(fontSize: 18.0)),
                  onPressed: () {
                    launch(newslink.attributes['href']);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}