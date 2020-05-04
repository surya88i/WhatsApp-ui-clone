import 'package:drawer/model/Callmodel.dart';
import 'package:flutter/material.dart';
class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
         padding: EdgeInsets.zero,
        itemCount: callData.length,
        itemBuilder: (context,index){
             return Column(
                children: <Widget>[
                  Divider(height: 0.1),
            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:AssetImage(callData[index].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Text(callData[index].name,
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
                    ),
                   Icon(index%2==0?Icons.call:Icons.videocam,
                   color: Theme.of(context).primaryColor,
                   )
                ],
              ),
              subtitle: Text(callData[index].time,
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
                    ),
            ),
                ],
              );
        }),
    );
  }
}