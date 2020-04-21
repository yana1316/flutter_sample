import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  TextEditingController _textFieldController = TextEditingController();
  bool _fingerprintChecked = false;
  double _birthDatePickerHeight = 0;
  bool _birthDatePickerVisible = false;
  DateTime _birthDay = DateTime.parse("2001-04-01 00:00:00");
  double _volume = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(239, 239, 244, 1),
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:8, top:16, bottom:8),
              child: Text( 'ユーザー情報', style: TextStyle( fontWeight:FontWeight.bold )
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("生年月日"),
              trailing: Text("${_birthDay.year}年${_birthDay.month}月${_birthDay.day}日"),
              onTap: (){
                birthDatePickerToggle();
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _birthDatePickerHeight,
            child: CupertinoDatePicker(
              initialDateTime: _birthDay,
              maximumDate: new DateTime(2021, 12, 30),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged:(DateTime newDateTime) {
                birthDayChanged(newDateTime);
              }
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:8, top:16, bottom:8),
              child: Text( 'セキュリティ', style: TextStyle( fontWeight:FontWeight.bold )
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text("パスワード"),
              trailing: Text("******"),
              onTap: (){
                _passwordDialog(context);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: ListTile(
              leading: Icon(Icons.fingerprint),
              title: Text("指紋認証"),
              trailing: Switch(
                value: _fingerprintChecked,
                onChanged: switchChanged,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:8, top:16, bottom:8),
              child: Text( '通知', style: TextStyle( fontWeight:FontWeight.bold )
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.volume_up),
              title: Text("ボリューム"),
              trailing: Text("${_volume.ceil()}"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: volumeChanged,
            ),
          ),

        ],
      ),
    );
  }
  void switchChanged(bool value){
    setState(() {
      _fingerprintChecked = value;
    });
  }
  void volumeChanged(double value){
    setState(() {
      _volume = value;
    });
  }
  void birthDatePickerToggle(){
    setState(() {
      _birthDatePickerVisible = !_birthDatePickerVisible;
      if( _birthDatePickerVisible ){
        _birthDatePickerHeight = 150;
      }else{
        _birthDatePickerHeight = 0;
      }
    });
  }
  void birthDayChanged(DateTime value){
    setState(() {
      _birthDay = value;
    });
  }

  _passwordDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('新しいパスワード'),
            content: TextField(
              controller: _textFieldController,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

