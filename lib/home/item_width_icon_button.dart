import 'package:flutter/material.dart';
import 'package:flutter_app_wx/home/constants.dart';

class ItemWidthIconButton extends StatelessWidget {
  ItemWidthIconButton({
    @required this.iconPath,
    @required this.title,
    this.isDivider: false,
    this.desc:"",
    @required this.voidCallback,
  })  : assert(iconPath != null),
        assert(title != null),
        assert(voidCallback != null);
  String iconPath;
  String title;
  bool isDivider;
  String desc;
  VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    Widget item;
    Widget item1 = Row(children:<Widget>[
      Expanded(
        child: Row(
          children: <Widget>[
            Image.asset(
              iconPath,
              width: Constants.FullWidthIconButtonSize,
              height: Constants.FullWidthIconButtonSize,
            ),
            SizedBox(width: Constants.MARGIN),
            Text(title),
          ],
        ),
      ),
      Text(desc,style: TextStyle(fontSize: 12.0,color: Color(0xffa9a9a9),fontWeight: FontWeight.bold),)
    ]

    );
    if (isDivider) {
      item = Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Image.asset(
                  iconPath,
                  width: Constants.FullWidthIconButtonSize,
                  height: Constants.FullWidthIconButtonSize,
                ),
                SizedBox(width: Constants.MARGIN),
                Text(title),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.2,
                        color: const Color(AppColors.DividerColor)))),
          )
        ],
      );
    } else if(desc.isNotEmpty){
      item = item1;
    }else{
      item = Row(
        children: <Widget>[
          Image.asset(
            iconPath,
            width: Constants.FullWidthIconButtonSize,
            height: Constants.FullWidthIconButtonSize,
          ),
          SizedBox(width: Constants.MARGIN),
          Text(title),
        ],
      );
    }

    return Container(
        height: 50,
        color: Colors.white,
        child: FlatButton(onPressed: voidCallback, child: item));
  }
}
