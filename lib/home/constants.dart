import 'package:flutter/material.dart';
import 'package:flutter_app_wx/model/conversation.dart';

class AppColors{
  static const BackgroundColor = 0xffebebeb;
  static const AppBarColor = 0xff303030;
  static const MenumColor = 0xffffffff;
  static const TabIconActive = 0xff46c11b;
  static const TAbIconNormal = 0xff999999;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const TitleColor = 0xff353535;
  static const ConversationItemColor = 0xffffffff;
  static const DescTextColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotifyDotBg = 0xffff3e3e;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBackground = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactGroupTitleBg = 0xffebebeb;
  static const ContactGroupTitleText = 0xff888888;
  static const IndexLetterBoxBg = Colors.black45;

  static const ChatBoxBg = 0xfff7f7f7;
}

class AppStyles{
  static const TitleStyle = TextStyle(
    fontSize: 14,
    color: Color(AppColors.TitleColor)
  );
  static const DescStyle = TextStyle(
    fontSize: 12,
    color: Color(AppColors.DescTextColor),
  );
  static const UnreadMsgCountDot = TextStyle(
      fontSize: 12,
      color: Color(AppColors.NotifyDotText)
  );
  static const DeviceInfoItemTextStyle = TextStyle(
      fontSize:13,
      color: Color(AppColors.DeviceInfoItemText)
  );
  static const GroupTitleItemTextStyle = TextStyle(
      fontSize: 14,
      color: Color(AppColors.ContactGroupTitleText)
  );
  static const IndexLetterBoxTextStyle = TextStyle(
      fontSize: 64,
      color: Colors.white
  );
}

class Routes{
  static const Home = "/";
  static const Conversation = "/conversation";
}

class Constants{
  static const IconFontFamily = "appIcont";
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnReadMsgNotifyDotSize = 20.0;
  static const ConversationMuteIconSize = 18.0;
  static const DeviceInfoItemHeight = 32.0;
  static const ContactAvatarSize = 36.0;
  static const IndexBarWidth = 24.0;
  static const IndexLetterBoxSize = 114.0;
  static const IndexLetterBoxRadius = 4.0;
  static const FullWidthIconButtonSize = 24.0;
  static const MARGIN = 10.0;
  static const ChatHeight = 40.0;
  static const ChatButtonHeight = 64.0;
}