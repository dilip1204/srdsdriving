import 'dart:ui';

import 'package:flutter/material.dart';

typedef bool ValidateButton(params);

class CustomButton extends StatelessWidget {
  const CustomButton(
      {key,
      this.questionname,
      this.questionorder,
      this.splash,
      this.height,
      this.width,
      @required this.onPressed})
      : super(key: key);
  final GestureTapCallback onPressed;
  final String questionorder;
  final String questionname;
  final Color splash;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);

    return RawMaterialButton(
      constraints: buttonTheme.getConstraints(null).copyWith(
            minWidth: width,
            minHeight: height,
          ),
      fillColor: Colors.white10,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 340.0,
                child: Text(
                  questionname + " " + questionorder,
                  maxLines: 8,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.normal),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: onPressed,
      splashColor: splash,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
    );
  }
}
