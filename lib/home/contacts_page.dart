import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_wx/home/constants.dart';
import 'package:flutter_app_wx/model/contacts.dart';

class _ContactsItem extends StatelessWidget {
  _ContactsItem(
      {Key key, @required this.contactsData, this.groupTitle, this.onPress})
      : super(key: key);
  ContactsData contactsData;
  var groupTitle;
  VoidCallback onPress;
  static double GROUP_TITLE_HEIGHT = 20.0;
  static double _height(bool isGroup) {
    double _buttonHeight = Constants.MARGIN * 2 + Constants.ContactAvatarSize;
    if (isGroup) {
      _buttonHeight += GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (contactsData.avatar.contains("https") ||
        contactsData.avatar.contains("http")) {
      avatar = Image.network(contactsData.avatar,
          width: Constants.ContactAvatarSize,
          height: Constants.ContactAvatarSize);
    } else {
      avatar = Image.asset(contactsData.avatar,
          width: Constants.ContactAvatarSize,
          height: Constants.ContactAvatarSize);
    }
    Widget _button = Container(
      padding: EdgeInsets.only(
          left: Constants.MARGIN, top: Constants.MARGIN, right: 18.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              avatar,
              SizedBox(
                width: Constants.MARGIN,
              ),
              Text(
                contactsData.name,
                style: AppStyles.GroupTitleItemTextStyle,
              )
            ],
          ),
//          SizedBox(
//            height: 10,
//          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 0.4,
            color: Color(AppColors.DescTextColor),
          )
        ],
      ),
    );
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            height: GROUP_TITLE_HEIGHT,
            padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
            color: Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(
              this.groupTitle,
              style: AppStyles.GroupTitleItemTextStyle,
            ),
          ),
          _button
        ],
      );
    } else {
      _itemBody = _button;
    }

    return _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  var barStr = "";
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

ContactsData newFriend = ContactsData(
    avatar: "assets/images/ic_new_friend.png", name: "新朋友", nameIndex: null);
ContactsData chat = ContactsData(
    avatar: "assets/images/ic_group_chat.png", name: "群聊", nameIndex: null);
ContactsData tag = ContactsData(
    avatar: "assets/images/ic_tag.png", name: "标签", nameIndex: null);
ContactsData num = ContactsData(
    avatar: "assets/images/ic_public_account.png",
    name: "公众号",
    nameIndex: null);
const INDEX_BAR_WORDS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class _ContactsPageState extends State<ContactsPage> {
  var model = ContactModel.mock();
  List<ContactsData> _contacts = [];
  Color _color = Colors.transparent;
  ScrollController _scrollController;
  Map _letterPosMap = {INDEX_BAR_WORDS[0]: 0.0};

  List<_ContactsItem> _functionButtons = [
    _ContactsItem(
        contactsData: newFriend,
        onPress: () {
          print("123");
        }),
    _ContactsItem(
        contactsData: chat,
        onPress: () {
          print("123");
        }),
    _ContactsItem(
        contactsData: tag,
        onPress: () {
          print("123");
        }),
    _ContactsItem(
        contactsData: num,
        onPress: () {
          print("123");
        }),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _contacts
      ..addAll(model.contacts)
      ..addAll(model.contacts)
      ..addAll(model.contacts);
    _contacts.sort(
        (ContactsData a, ContactsData b) => a.nameIndex.compareTo(b.nameIndex));
    var _totalPos = _functionButtons.length * _ContactsItem._height(false);
    for (int i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;
      if (i > 0 &&
          _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0) {
        _hasGroupTitle = false;
      }
      if (_hasGroupTitle) {
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      _totalPos += _ContactsItem._height(_hasGroupTitle);
    }
  }

  //根据索引获取字符
  String getLetter(BuildContext context, int titleHeight, Offset globalPos) {
    RenderBox _box = context.findRenderObject();
    Offset offset = _box.globalToLocal(globalPos);
    //clamp 取值范围 0 到 27
    int index = (offset.dy ~/ titleHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  _jumpToIndex(String letter) {
    if (_letterPosMap.isNotEmpty) {
      var posMap = _letterPosMap[letter];
      if (posMap != null) {
        _scrollController.animateTo(posMap,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints boxConstraints) {
    var _totalHeight = boxConstraints.biggest.height;
    var _tileHeight = _totalHeight ~/ INDEX_BAR_WORDS.length;

    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details) {
        setState(() {
          _color = Colors.black26;
          widget.barStr =
              getLetter(context, _tileHeight, details.globalPosition);
          _jumpToIndex(widget.barStr);
        });
      },
      onVerticalDragCancel: () {
        setState(() {
          _color = Colors.transparent;
        });
      },
      onVerticalDragEnd: (details) {
        setState(() {
          widget.barStr = "";
          _color = Colors.transparent;
        });
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          _color = Colors.black26;
          widget.barStr =
              getLetter(context, _tileHeight, details.globalPosition);
          _jumpToIndex(widget.barStr);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _letters,
      ),
    );
  }

  List<Widget> _letters = INDEX_BAR_WORDS.map((String txt) {
    return Expanded(
      child: Text(txt),
    );
  }).toList();
  @override
  Widget build(BuildContext context) {
    return Stack(
        overflow: Overflow.visible,
        alignment: Alignment.centerRight,
        children: <Widget>[
          ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < _functionButtons.length) {
                return _functionButtons[index];
              }
              int _contactsIndex = index - _functionButtons.length;
              var contact = _contacts[_contactsIndex];
              bool _isGroupTitle = true;
              if (_contactsIndex >= 1 &&
                  contact.nameIndex ==
                      _contacts[_contactsIndex - 1].nameIndex) {
                _isGroupTitle = false;
              }

              return _ContactsItem(
                contactsData: _contacts[_contactsIndex],
                groupTitle:
                    _isGroupTitle ? _contacts[_contactsIndex].nameIndex : null,
              );
            },
            itemCount: _contacts.length + _functionButtons.length,
          ),
          Positioned(
            child: Container(
              width: Constants.IndexBarWidth,
              alignment: Alignment.bottomCenter,
              color: _color,
              child: LayoutBuilder(   //经常看看，加深影响
                builder: _buildIndexBar,
              ),
            ),
          ),
          Center(
            child: Container(
              width: Constants.IndexLetterBoxSize,
              height: Constants.IndexLetterBoxSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: _color, borderRadius: BorderRadius.circular(57)),
              child: Text(
                widget.barStr,
                style: AppStyles.IndexLetterBoxTextStyle,
              ),
            ),
          )
        ]);
  }
}
