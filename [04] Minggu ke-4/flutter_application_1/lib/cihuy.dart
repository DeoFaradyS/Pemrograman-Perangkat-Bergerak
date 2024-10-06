import 'package:flutter/material.dart';

DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        tabs: [
          Tab(iconL Icon(Icons.home).text:"Home"),
          Tab(iconL Icon(Icons.alarm).text:"Alarm"),
          Tab(iconL Icon(Icons.settings).text:"Settings"),
        ],
      ), 
    ),

    body: TabBarView(
      children: [
        Icon(Icons.home),
        Icon(Icons.alarm),
        Icon(Icons.settings),
        ],
      ),
  ),
);
