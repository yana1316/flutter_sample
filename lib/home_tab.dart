import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
            child: Row(
              children:[
                Icon(
                  Icons.account_circle,
                  color: Colors.grey.shade400,
                  size: 96,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("谷中 太郎", style: TextStyle(fontSize: 28.0)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.local_parking,
                  color: Colors.grey.shade400,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("保有ポイント: 2,400pt", style: TextStyle(fontSize: 18.0)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.people,
                  color: Colors.grey.shade400,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("フレンド数: 15", style: TextStyle(fontSize: 18.0)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}