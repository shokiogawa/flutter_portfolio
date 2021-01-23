import 'package:communitygetandpost/config.dart';
import 'package:communitygetandpost/di.dart';
import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:communitygetandpost/view/community_detail_page.dart';
import 'package:communitygetandpost/view/community_list_page.dart';
import 'package:communitygetandpost/view/my_page.dart';
import 'package:communitygetandpost/view/new_post_page.dart';
import 'package:communitygetandpost/view/new_post_page_next.dart';
import 'package:communitygetandpost/view/screen/home_screen.dart';
import 'package:communitygetandpost/view/screen/login_screen.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  final flavor =EnumToString.fromString(Flavor.values, const String.fromEnvironment('FLAVOR'));
  print(flavor.toString());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: globalProviders,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      // HomeScreen(),
      FutureBuilder(
        future: Provider.of<LoginPageController>(context, listen: false).isSignIn(),
          builder: (context, AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData && snapshot.data){
            return HomeScreen();
          }else{
            return LoginScreen();
          }
          }),
      // HomeScreen(),
      routes: {
        '/home_screen':(BuildContext context) => HomeScreen(),
        '/my_page':(BuildContext context) => MyPage(),
        '/community_list_page':(BuildContext context) => CommunityListPage(),
        '/community_detail_page': (BuildContext context) => CommunityDetailPage(),
        '/login_page': (BuildContext context) => LoginScreen(),
        '/new_post_page':(BuildContext context) => NewPostPage(),
        '/new_post_page_next': (BuildContext context) => NewPostPageNext()
      },
    );
  }
}




