import 'package:flutter/material.dart';
import 'package:flutter_app_wx/conversation/conversation_detail_args.dart';
import 'package:flutter_app_wx/home/constants.dart';

class ConversationDetailsPage extends StatefulWidget {
  @override
  _ConversationDetailsPageState createState() =>
      _ConversationDetailsPageState();
}

class _ConversationDetailsPageState extends State<ConversationDetailsPage> {
  final chatBoxRadius = 4.0;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ConversationDetailsArgs conversationDetailsArgs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(conversationDetailsArgs.title),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  Icon(IconData(0xe609, fontFamily: Constants.IconFontFamily))),
          brightness: Brightness.light,
          backgroundColor: const Color(AppColors.AppBarColor),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  IconData(
                    0xe728,
                    fontFamily: Constants.IconFontFamily,
                  ),
                  size: 22,
                  color: Color(AppColors.AppBarPopupMenuColor),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.cyanAccent,
              ),
            ),
            Container(
              height: Constants.ChatButtonHeight,
              padding: EdgeInsets.symmetric(horizontal: Constants.MARGIN),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border(
                      top: BorderSide(
                          color: const Color(AppColors.DividerColor)))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(IconData(0xe60a, fontFamily: Constants.IconFontFamily)),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Constants.MARGIN),
                      decoration: BoxDecoration(
                          color: Color(AppColors.MenumColor),
                          borderRadius: BorderRadius.circular(chatBoxRadius)),
                      height: Constants.ChatHeight,
                      child: LayoutBuilder(
                        builder: (context, size) {
                          TextSpan _text = TextSpan(
                            text: _controller.text,
                          );

                          TextPainter _tp = TextPainter(
                            text: _text,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left
                          );

                          return TextField(
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10)));
                        },
                      ),
                    ),
                  ),
                  Icon(IconData(0xe60d, fontFamily: Constants.IconFontFamily)),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(IconData(0xe62e, fontFamily: Constants.IconFontFamily)),
                ],
              ),
            )
          ],
        ));
  }
}
