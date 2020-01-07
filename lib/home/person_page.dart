import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_wx/home/constants.dart';
import 'package:flutter_app_wx/home/item_width_icon_button.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    padding: EdgeInsets.only(top: 4.0,bottom: 4.0),
                    child: ClipRRect(
//                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset("assets/images/photo.png"),
                    ),
                    height:60,
                    width: 60,
//                    color: Colors.red,
                  ),
                  SizedBox(
                    width: Constants.MARGIN,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Everday"),
                      SizedBox(
                        height: Constants.MARGIN,
                      ),
                      Text("微信号:wang602718463")
                    ],
                  )),
                  Image.asset(
                    "assets/images/ic_qrcode_preview_tiny.png",
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.bottomCenter,
                  ),
                  SizedBox(
                    width: Constants.MARGIN,
                  ),
                ],
              )),
          SizedBox(
            height: Constants.MARGIN,
          ),
          ItemWidthIconButton(
              iconPath: "assets/images/ic_wallet.png",
              title: "支付",
              voidCallback: () {
                setState(() {
                  print("支付");
                });
              }),
          SizedBox(
            height: Constants.MARGIN,
          ),
          ItemWidthIconButton(
              iconPath: "assets/images/ic_collections.png",
              title: "收藏",
              isDivider: true,
              voidCallback: () {
                setState(() {
                  print("支付");
                });
              }),
          ItemWidthIconButton(
              iconPath: "assets/images/ic_album.png",
              title: "相册",
              isDivider: true,
              voidCallback: () {
                setState(() {
                  print("支付");
                });
              }),
          ItemWidthIconButton(
              iconPath: "assets/images/ic_cards_wallet.png",
              title: "卡包",
              isDivider: true,
              voidCallback: () {
                setState(() {
                  print("支付");
                });
              }),
          ItemWidthIconButton(
              iconPath: "assets/images/ic_emotions.png",
              title: "表情",
              isDivider: true,
              voidCallback: () {
                setState(() {
                  print("支付");
                });
              }),
          SizedBox(
            height: Constants.MARGIN,
          ),
          ItemWidthIconButton(
              iconPath: "assets/images/ic_settings.png",
              title: "设置",
              desc: "账号保护",
              voidCallback: () {
                setState(() {
                  print("支付");
                });
              }),
        ],
      ),
    );
  }
}
