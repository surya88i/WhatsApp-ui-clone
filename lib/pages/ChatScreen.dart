import 'package:drawer/model/chatmodel.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: chatsData.length,
      itemBuilder: (context,index){
        return Column(
          children: <Widget>[
            Divider(height: 0.1),
            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:AssetImage(chatsData[index].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Text(chatsData[index].name,
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
                    ),
                    Text(chatsData[index].time,
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
                    ),
                ],
              ),
              subtitle: Text(chatsData[index].msg,
              style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }
}