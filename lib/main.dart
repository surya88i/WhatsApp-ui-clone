import 'package:drawer/tabs/calls.dart';
import 'package:flutter/material.dart';
import 'pages/CallsScreen.dart';
import 'pages/CameraScreen.dart';
import 'pages/ChatScreen.dart';
import 'pages/StatusScreen.dart';
import 'search/DataSearch.dart';
import 'tabs/Status.dart';
import 'tabs/User.dart';
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsApp",
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        accentColor: Color(0xff25d366),
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  List<User> users;
  List<Status> status;
  List<Calls> calls;
  bool isScrollable;
  @override
  void initState() {
    super.initState();
    users = User.getUsers();
    status = Status.getStatus();
    isScrollable=true;
    calls = Calls.getCalls();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {
        });
      });
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerScrollView) {
          return [
            SliverAppBar(
              title: Text("WhatsApp"),
              floating: true,
              pinned: true,
              snap: true,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
              ),
              forceElevated: innerScrollView,
              actions: tabController.index == 0
                  ? null
                  : <Widget>[
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              showSearch(
                                  context: context, delegate: DataSearch());
                            });
                          }),
                      tabController.index == 1
                          ? PopupMenuButton(itemBuilder: (context) {
                              return users.map((user) {
                                return PopupMenuItem(
                                    value: user, child: Text(user.title));
                              }).toList();
                            })
                          : tabController.index == 2
                              ? PopupMenuButton(itemBuilder: (context) {
                                  return status.map((status) {
                                    return PopupMenuItem(
                                        value: status,
                                        child: Text(status.title));
                                  }).toList();
                                })
                              : PopupMenuButton(itemBuilder: (context) {
                                  return calls.map((calls) {
                                    return PopupMenuItem(
                                        value: calls, child: Text(calls.title));
                                  }).toList();
                                }),
                    ],
              bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.only(bottom: 0.5),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(text: "CHATS"),
                Tab(text: "STATUS"),
                Tab(text: "CALLS"),
              ]),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ]),
      ),
      floatingActionButton: tabController.index == 0
          ? null
          : tabController.index == 1
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                )
              : tabController.index == 2
                  ? Flex(
                    direction: Axis.vertical,
                    mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            mini: true,
                            heroTag: const DefaultShaderWarmUp(),
                            onPressed: () {},
                            child: Icon(
                              Icons.edit,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                  : FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add_call,
                        color: Colors.white,
                      ),
                    ),
    );
  }
}
