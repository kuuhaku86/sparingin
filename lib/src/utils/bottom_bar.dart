import 'package:flutter/cupertino.dart';
import 'package:sparingin/src/utils/colors.dart';

class DefaultBottomBar extends StatelessWidget {
  final Color color;
  const DefaultBottomBar({Key key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: color,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Developed by ",
                style: TextStyle(
                  color: MyColors.font,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}