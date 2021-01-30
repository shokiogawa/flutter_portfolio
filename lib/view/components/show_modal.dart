import 'package:communitygetandpost/view/components/button.dart'as button;
import 'package:flutter/material.dart';

class ShowModal extends StatelessWidget {
  final VoidCallback onPressed;
  final String letter;
  final String buttonLetter;
  final Widget innerCircle;
  ShowModal({this.onPressed, this.letter, this.buttonLetter, this.innerCircle});
  @override
  Widget build(BuildContext context) {
    final black = Theme.of(context).textTheme.button.color;

    return SimpleDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 30),
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 20),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                  child: Text(letter,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16)))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: button.Button(
                              letter: buttonLetter,
                              onPressed: onPressed,
                              kind: button.ButtonTheme.Positive,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.amber,
                  child: innerCircle,
                ),
              )
            ],
          ),
        ),
      ],
    );;
  }

}
