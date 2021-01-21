
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:jds_design/jds_design.dart';

class EmptyData extends StatelessWidget {
  final String title, message;
  final EdgeInsetsGeometry margin;
  final String image;

  /// * [title] type String must not be null.
  /// * [message] type String.
  /// * [margin] type from class EdgeInsetsGeometry.
  /// * [image] type String. If [image] is null, default flare will be used.
  EmptyData(
      {@required this.title,
        this.message,
        this.margin,
        this.image}):assert(title != null);

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image == null
                ? Container(
              width: 200.0,
              height: 200.0,
              child: FlareActor(
                Assets.flareEmptyData,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'empty',
              ),
            )
                : Container(
              width: 200.0,
              height: 200.0,
              child: Image.asset(image),
            ),
            Text(title,
                style: JDSTextTheme.body1()),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:EdgeInsets.only(left: 50, right: 50),
              child: Text(message == null ? '' : message,
                  textAlign: TextAlign.center,
                  style: JDSTextTheme.body2()),
            )
          ],
        ),
      );
  }
}