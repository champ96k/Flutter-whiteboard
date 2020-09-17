import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whiteboard/services/url_launcher.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Method _method = Method();
  DrawingController controller;
  @override
  void initState() {
    controller = new DrawingController();
    controller.onChange().listen((draw) {
      //do something with it
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  //  backgroundColor: Colors.indigo,
                  radius: 42.0,
                  backgroundImage: AssetImage("images/man.png")),
              accountName: Text("Tushar Nikam"),
              accountEmail: Text("champ96k@gmail.com"),
            ),
            ListTile(
              onTap: () {
                _method.launchEmail();
              },
              title: Text("Contact"),
              trailing: Icon(
                Icons.mail,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {
                _method.launchURL("https://champ96k.github.io/");
              },
              title: Text("Share"),
              trailing: Icon(
                Icons.share,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {
                _method.launchURL("https://champ96k.github.io/");
              },
              title: Text("About Us"),
              trailing: Icon(
                Icons.person,
                size: 15,
              ),
            ),
            ListTile(
              onTap: () {
                exit(0);
              },
              title: Text("Exit"),
              trailing: Icon(
                Icons.exit_to_app,
                size: 15,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Version 1.0.1"),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          "Champ Whiteboard",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: Colors.black,
        child: Container(
          margin: EdgeInsets.all(4.0),
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Whiteboard(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
