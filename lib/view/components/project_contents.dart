import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectContents extends StatelessWidget {
  final Project project;

  ProjectContents(this.project);

  @override
  Widget build(BuildContext context) {
    final black = Theme.of(context).textTheme.button.color;
    final opacityBlack = Theme.of(context).primaryTextTheme.button.color;
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: _imageArea(project.imageUrl)),
        Expanded(flex: 2, child: _textArea(project, black, opacityBlack))
      ],
    );
  }

  Widget _imageArea(String url) {
    return ConstrainedBox(
        constraints: BoxConstraints.expand(
          height: 110,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ));
  }



  Widget _textArea(
      Project project, Color black, Color opacityBlack) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 3.0),
            child: Container(
              height: 35,
              child: Text(
                project.projectName,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Container(
            ),
          ),
        ],
      ),
    );
  }
}
