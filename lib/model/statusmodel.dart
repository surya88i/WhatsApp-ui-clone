class StatusModel
{
  final String name;
  final String time;
  final String msg;
  final String pic;
  StatusModel({this.name,this.time,this.msg,this.pic});
}
List<StatusModel> statusData=[
    new StatusModel(name:"Suresh",time: "12.30 PM",msg:"Hi Suresh",pic: "assets/burger.png"),
    new StatusModel(name:"Sunil",time: "yesterday",msg:"Hi Sunil",pic: "assets/cheese.png"),
    new StatusModel(name:"Akash",time: "today",msg:"Hi Akash",pic: "assets/pizza.png"),
    new StatusModel(name:"Suraj",time: "1.30 AM",msg:"Hi Suraj",pic: "assets/sandwich.png"),
    new StatusModel(name:"Arjun",time: "yesterday",msg:"Hi Sunil",pic: "assets/cheese.png"),
    new StatusModel(name:"Suraj",time: "today",msg:"Hi Akash",pic: "assets/pizza.png"),
    new StatusModel(name:"Nivas",time: "1.30 AM",msg:"Hi Suraj",pic: "assets/sandwich.png"),
  ];
