import 'package:flutter/material.dart';
import 'package:flutter_app_wx/conversation/conversation_details_page.dart';
import 'package:flutter_app_wx/home/constants.dart';
import 'package:flutter_app_wx/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(AppColors.AppBarColor),
        cardColor: Colors.black26,
      ),
      initialRoute: Routes.Home,
      routes: {
        Routes.Home:(context)  => HomeScreen(),
        Routes.Conversation:(context) => ConversationDetailsPage()
      },
//      home: HomeScreen(),
    );
  }
}
