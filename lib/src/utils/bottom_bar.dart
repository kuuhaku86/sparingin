import 'package:flutter/cupertino.dart';
import 'package:sparingin/src/utils/colors.dart';

class DefaultBottomBar extends StatelessWidget {
  const DefaultBottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.background,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Developed by"
          ),
        ],
      ),
    );
  }
}