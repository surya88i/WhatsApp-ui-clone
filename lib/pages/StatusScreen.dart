import 'package:drawer/model/statusmodel.dart';
import 'package:flutter/material.dart';
class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  onTap: (){},
                  leading: Container(
                    width:50.0,
                    child: Stack(
                      children: <Widget>[
                        ClipOval(
                          child:Image.asset('assets/sandwich.png',
                          width: 50,
                          height: 50,
                          )
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(20.0),
                              
                            ),
                            child: Icon(Icons.add,color: Colors.white,size: 15.0,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text('My Status',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text("Tap status to update"),
                ),
              ),
            ],
          ),
          SizedBox(
            height:30.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Text('Recent Updates',
                style: TextStyle(fontWeight: FontWeight.w500,color:Colors.grey.shade500),
              ),
            ),
          ),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: statusData.length,
            itemBuilder: (context,index){
              return Column(
                children: <Widget>[
                  Divider(height: 0.1),
            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:AssetImage(statusData[index].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Text(statusData[index].name,
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
                    ),
                   
                ],
              ),
              subtitle: Text(statusData[index].time,
                    style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w400),
                    ),
            ),
                ],
              );
            })),
        ],
      ),
    );
  }
}