import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{
  final cities=[
    "Pune",
    "Mumabai",
    "Satara",
    "Kolhapur",
    "Nashik",
    "Nanded",
    "Raigad",
    "Ratnagiri",
  ];
  final recentCities=[
    "Mumabai",
    "Satara",
    "Kolhapur",
    "Nashik",
    "Nanded",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty?IconButton(icon: Icon(Icons.mic), onPressed: (){})
      :IconButton(icon: Icon(Icons.close),onPressed: (){
        query='';
      }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,), onPressed: (){
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text("$query"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty?recentCities:cities.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
        return ListTile(
          onTap: (){
            showResults(context);
          },
          title: RichText(text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style:TextStyle(color: Colors.black),
            children: [
              TextSpan(
                 text: suggestionList[index].substring(query.length),
                 style:TextStyle(color: Colors.grey),
              ),
            ],
          )),
        );
      },
    );
  }

}