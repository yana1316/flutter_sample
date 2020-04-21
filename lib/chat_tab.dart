import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.grey.shade400,
              size: 48,
              ),
            title: Text("釜戸 炭治郎", style: TextStyle(fontSize: 18.0)),
            subtitle: Text("You sent a stickr."),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ItemDetailsPage(
                      title: "釜戸 炭治郎"
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.grey.shade400,
              size: 48,
            ),
            title: Text("橋平 伊之助", style: TextStyle(fontSize: 18.0)),
            subtitle: Text("おはようございます。昨日のケーキは美味しかったですね。",
            style: TextStyle(fontSize: 12.0)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ItemDetailsPage(
                      title: "橋平 伊之助"
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.grey.shade400,
              size: 48,
            ),
            title: Text("我妻 善逸", style: TextStyle(fontSize: 18.0)),
            subtitle: Text("もうダメだ・・・。",
                style: TextStyle(fontSize: 12.0)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ItemDetailsPage(
                      title: "我妻 善逸"
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemDetailsPage extends StatefulWidget {
  final String title;

  ItemDetailsPage({
    @required this.title,
  });

  @override
  _ItemDetails createState() => _ItemDetails(title:title);
}

class _ItemDetails extends State<ItemDetailsPage> {
  String title;
  _ItemDetails({@required this.title});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Bubble(
              alignment: Alignment.center,
              color: Color.fromRGBO(212, 234, 244, 1.0),
              child: Text('昨日', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topRight,
              nip: BubbleNip.rightTop,
              color: Color.fromRGBO(133, 226, 73, 1.0),
              child: Text('お疲れさまでした！', textAlign: TextAlign.right),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              nip: BubbleNip.leftTop,
              child: Text('おつかれー'),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              nip: BubbleNip.leftTop,
              child: Text('またねー'),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.center,
              nip: BubbleNip.no,
              color: Color.fromRGBO(212, 234, 244, 1.0),
              child: Text('今日', textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10, left:90),
              alignment: Alignment.topRight,
              nip: BubbleNip.rightTop,
              color: Color.fromRGBO(133, 226, 73, 1.0),
              child: Text('本日のお打ち合わせですが、11:00〜でよろしかったでしょうか？', textAlign: TextAlign.right),
            ),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              alignment: Alignment.topLeft,
              nip: BubbleNip.leftTop,
              child: Text('どうぞー'),
            ),
          ],
        ),
      ),
    );
  }
}