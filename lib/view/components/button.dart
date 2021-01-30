import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum ButtonTheme { Positive, Negative }

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String letter;
  final ButtonTheme kind;
  final bool isFutureBuilding;

  Button({this.onPressed, this.letter, this.kind, this.isFutureBuilding = false});

  @override
  Widget build(BuildContext context) {
    var buttonColor;
    switch (kind) {
      case ButtonTheme.Positive:
        buttonColor = Theme.of(context).accentColor;
        break;
      case ButtonTheme.Negative:
        buttonColor = Theme.of(context).buttonColor;
        break;
    }

    return Container(
        width: 140,
        height: 50,
        child: RaisedButton(
          textColor: Theme.of(context).textTheme.button.color,
          disabledTextColor: Theme.of(context).primaryColor,
          disabledColor: Theme.of(context).buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: buttonColor,
          onPressed: onPressed,
          child: AnimatedCrossFade(
            layoutBuilder: (first, _, second, __) => IntrinsicWidth(
              child: IntrinsicHeight(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    first,
                    second,
                  ],
                ),
              ),
            ),
            firstChild: Text(letter,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            secondChild: SpinKitThreeBounce(
              color: Colors.white70,
              size: 24,
            ),
            crossFadeState: isFutureBuilding
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ));
  }
}
