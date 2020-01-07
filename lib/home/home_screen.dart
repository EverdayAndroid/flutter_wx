import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_wx/home/contacts_page.dart';
import 'package:flutter_app_wx/home/find.dart';
import 'package:flutter_app_wx/home/person_page.dart';
import 'package:flutter_app_wx/page/conversation_page.dart';

import 'constants.dart';

enum ActionItems { GROUP_CHAR, ADD_FRIEND, QR_SCAN, PALMENT }

class NavigationIconView {
//  final IconData _icon;
//  final IconData _activeIcon;
//  final String _title;
//  final Color _color;
  final BottomNavigationBarItem item;
  NavigationIconView(
      {IconData icon, IconData activeIcon, String title, Color color})
      :
//        _icon = icon,
//        _activeIcon = activeIcon,
//        _title = title,
//        _color = color,
        item = BottomNavigationBarItem(
            icon: Icon(icon),
            title: Text(
              title,
            ),
            activeIcon: Icon(
              activeIcon,
            ));
}

class HomeScreen extends StatefulWidget {
  Color headBackground;
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = [
      NavigationIconView(
          icon: IconData(0xe67c, fontFamily: Constants.IconFontFamily),
          title: '聊天',
          activeIcon: IconData(0xe620, fontFamily: Constants.IconFontFamily),
          color: Colors.grey),
      NavigationIconView(
          icon: const IconData(0xe604, fontFamily: Constants.IconFontFamily),
          title: '通讯录',
          activeIcon: IconData(0xe602, fontFamily: Constants.IconFontFamily),
          color: Colors.red),
      NavigationIconView(
          icon: const IconData(0xe601, fontFamily: Constants.IconFontFamily),
          title: '发现',
          activeIcon: IconData(0xe67a, fontFamily: Constants.IconFontFamily),
          color: Colors.cyanAccent),
      NavigationIconView(
          icon: const IconData(0xe62d, fontFamily: Constants.IconFontFamily),
          title: '我',
          activeIcon: IconData(0xe67b, fontFamily: Constants.IconFontFamily),
          color: Colors.cyanAccent)
    ];

    _pageController = PageController(
        initialPage: _currentIndex,
//        viewportFraction: 10.0
    );
    _pages = [
      ConversationPage(),
      ContactsPage(),
      FindPage(),
      PersonPage()
    ];
  }

  _buildPopupMunuIem(IconData iconData, String title) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: const Color(AppColors.AppBarPopupMenuColor),
        ),
        Container(padding: EdgeInsets.only(right: 12)),
        Text(
          title,
          style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //设置statusbar背景颜色透明
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent
    ));
    var botNavBar = BottomNavigationBar(
      elevation: 10,
        fixedColor: const Color(AppColors.TabIconActive),
        items: _navigationViews
            .map((NavigationIconView navigationView) => navigationView.item)
            .toList(),
        currentIndex: _currentIndex,
        type: _type,
//        unselectedItemColor: Colors.red,
//        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateTo(_currentIndex.toDouble(),
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInSine);
            print("第$_currentIndex个索引");
          }

          );
          if(index == 0){
            widget.headBackground = Colors.white;
          }else if(index == 1){
            widget.headBackground = Colors.blue;
          }else if(index == 2){
            widget.headBackground = Colors.yellow;
          }else if(index == 3){
            widget.headBackground = Colors.red;
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        backgroundColor: widget.headBackground,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                IconData(
                  0xe606,
                  fontFamily: "appIcont",
                ),
                size: 22,
              ),
              onPressed: _IconClick,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              onSelected: (value) {
                setState(() {
                  print(value);
                });
              },
              color: Color(AppColors.AppBarColor),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: _buildPopupMunuIem(
                        IconData(0xe625, fontFamily: Constants.IconFontFamily),
                        "发起群聊"),
                    value: ActionItems.GROUP_CHAR,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMunuIem(
                        IconData(0xe641, fontFamily: Constants.IconFontFamily),
                        "添加朋友"),
                    value: ActionItems.ADD_FRIEND,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMunuIem(
                        IconData(0xe66d, fontFamily: Constants.IconFontFamily),
                        "扫一扫"),
                    value: ActionItems.QR_SCAN,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMunuIem(
                        IconData(0xe605, fontFamily: Constants.IconFontFamily),
                        "收付款"),
                    value: ActionItems.PALMENT,
                  )
                ];
              },
              icon: Icon(
                IconData(
                  0xe62e,
                  fontFamily: Constants.IconFontFamily,
                ),
                size: 22,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: PageView.builder(
            itemBuilder: (context, index) {
          return _pages[_currentIndex];
        },
          controller: _pageController,
//          dragStartBehavior: DragStartBehavior.start,
          itemCount: _pages.length,

          onPageChanged: (index){
              setState(() {
                _currentIndex = index;
                print("pageView $_currentIndex");
              });
              if(index == 0){
                widget.headBackground = Colors.white;
              }else if(index == 1){
                widget.headBackground = Colors.blue;
              }else if(index == 2){
                widget.headBackground = Colors.yellow;
              }else if(index == 3){
                widget.headBackground = Colors.red;
              }
          },
        ),
      ),
      bottomNavigationBar: botNavBar,
    );
  }

  _IconClick() {
    print("123");
  }
}
