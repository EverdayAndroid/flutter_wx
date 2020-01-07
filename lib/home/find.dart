import 'package:flutter/material.dart';
import 'package:flutter_app_wx/home/constants.dart';
import 'package:flutter_app_wx/home/item_width_icon_button.dart';

class FindPage extends StatefulWidget {
  @override
  State createState() => FindPageState();
}

class FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            ItemWidthIconButton(
              iconPath: "assets/images/ic_social_circle.png",
              title: "朋友圈",
              voidCallback: () {},
            ),
            SizedBox(
              height: 20.0,
            ),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_quick_scan.png",
                title: "扫一扫",
                isDivider: true,
                voidCallback: () {
                  setState(() {
                    print("扫一扫");
                  });
                }),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_shake_phone.png",
                title: "摇一摇",
                voidCallback: () {
                  setState(() {
                    print("摇一摇");
                  });
                }),
            SizedBox(
              height: 20.0,
            ),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_feeds.png",
                title: "看一看",
                isDivider: true,
                voidCallback: () {
                  setState(() {
                    print("看一看");
                  });
                }),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_quick_search.png",
                title: "搜一搜",
                voidCallback: () {
                  setState(() {
                    print("搜一搜");
                  });
                }),
            SizedBox(
              height: 20.0,
            ),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_people_nearby.png",
                title: "附近的人",
                isDivider: true,
                voidCallback: () {
                  setState(() {
                    print("附近的人");
                  });
                }),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_bottle_msg.png",
                title: "漂流瓶",
                voidCallback: () {
                  setState(() {
                    print("漂流瓶");
                  });
                }),
            SizedBox(
              height: 20.0,
            ),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_shopping.png",
                title: "购物",
                isDivider: true,
                voidCallback: () {
                  setState(() {
                    print("购物");
                  });
                }),
            ItemWidthIconButton(
                iconPath: "assets/images/ic_game_entry.png",
                title: "游戏",
                voidCallback: () {
                  setState(() {
                    print("游戏");
                  });
                }),
          ],
        ),
      ),
    );
  }
}
