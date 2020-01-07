import 'package:flutter/material.dart';
import 'package:flutter_app_wx/conversation/conversation_detail_args.dart';
import 'package:flutter_app_wx/home/constants.dart';
import 'package:flutter_app_wx/model/conversation.dart';

enum Device { MAC, WIN }

class _ConversationItme extends StatelessWidget {
  _ConversationItme({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);
  final Conversation conversation;
  var topPos;

  //相当于Android PopuWindos
  showButtonMenu(BuildContext context, Offset offset) {
    //会生成固定的一个x轴和y轴的坐标系
    RenderBox overlay = Overlay.of(context).context.findRenderObject();
    //overlay x轴减去 手指点击的offset  x轴；   overlay y轴减去 手指点击的offset  y轴
    RelativeRect posistion = RelativeRect.fromLTRB(offset.dx, offset.dy,
        overlay.size.width - offset.dx, overlay.size.height);
    showMenu<String>(
        context: context,
        position: posistion,
        items: <PopupMenuItem<String>>[
          PopupMenuItem(
            child: Text("标为未读"),
            value: "标为未读",
          ),
          PopupMenuItem(
            child: Text("置顶聊天"),
            value: "置顶聊天",
          ),
          PopupMenuItem(
            child: Text("删除该聊天"),
            value: "删除该聊天",
          ),
        ]).then((str) {
      print(str);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize);
    } else {
      avatar = Image.asset(conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize);
    }

    Widget avatarContainer;
    if (conversation.unreadMsgCount > 0) {
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          conversation.unreadMsgCount.toString(),
          style: AppStyles.UnreadMsgCountDot,
        ),
      );
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            child: unreadMsgCountText,
            top: -3,
            right: -6,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    Widget muteIcon;
    if (conversation.isMute) {
      muteIcon = Icon(
        IconData(0xe694, fontFamily: Constants.IconFontFamily),
        color: Color(AppColors.ConversationMuteIcon),
      );
    } else {
      muteIcon = Icon(
        IconData(0xe694, fontFamily: Constants.IconFontFamily),
        color: Colors.transparent,
      );
    }

    return Material(
      color: Color(AppColors.AppBarPopupMenuColor),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context,
              Routes.Conversation,
          arguments: ConversationDetailsArgs(conversation.title));
        },
        onTapDown: (details) {
          topPos = details.globalPosition;
        },
        onLongPress: () {
          showButtonMenu(context, topPos);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              avatarContainer,
              Container(
                padding: EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      conversation.title,
                      style: AppStyles.TitleStyle,
                    ),
                    Text(
                      conversation.des,
                      style: AppStyles.DescStyle,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    conversation.updateAt,
                    style: AppStyles.TitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  muteIcon
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Color(AppColors.ConversationItemColor),
              border: Border(
                  bottom: BorderSide(
                      color: Color(AppColors.DescTextColor),
                      width: Constants.DividerWidth,
                      style: BorderStyle.solid))),
        ),
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {
  const _DeviceInfoItem({Key key, this.device: Device.WIN})
      : assert(device != null);
  final Device device;

  int get IconName {
    return device == Device.WIN ? 0xe6c9 : 0xe608;
  }

  String get _deviceName {
    return device == Device.WIN ? "Windows" : "MAC";
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding:
            EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: Constants.DividerWidth,
                    color: Color(AppColors.DividerColor))),
            color: Color(AppColors.DeviceInfoItemBackground)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(IconData(IconName, fontFamily: Constants.IconFontFamily)),
            SizedBox(
              width: 16.0,
            ),
            Text(
              "$_deviceName微信已登录，手机通知已关闭",
              style: AppStyles.DeviceInfoItemTextStyle,
            )
          ],
        ));
  }
}

class ConversationPage extends StatefulWidget {
  @override
  State createState() => ConversationPageState();
}

class ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    ConversationData conversationData = ConversationData.mock();

    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return _DeviceInfoItem(
            device: conversationData.device,
          );
        } else {
          return _ConversationItme(
            conversation: conversationData.conversations[index - 1],
          );
        }
      },
      itemCount: mockConversation.length + 1,
    );
  }
}
