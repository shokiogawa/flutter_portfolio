import 'package:communitygetandpost/view/community_detail_page.dart';
import 'package:communitygetandpost/view/community_list_page.dart';
import 'package:communitygetandpost/view/login_page.dart';
import 'package:communitygetandpost/view/my_page.dart';
import 'package:communitygetandpost/view/new_post_page.dart';
import 'package:communitygetandpost/view/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        'my_page':(BuildContext context) => MyPage(),
        'community_list_page':(BuildContext context) => CommunityListPage(),
        'community_detail_page': (BuildContext context) => CommunityDetailPage(),
        'login_page': (BuildContext context) => LoginPage(),
        'new_post_page':(BuildContext context) => NewPostPage()
      },
    );
  }
}




