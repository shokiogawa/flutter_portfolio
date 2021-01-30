import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/view/components/button.dart' as button;
import 'package:communitygetandpost/view/components/show_modal.dart';
import 'package:communitygetandpost/view/components/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:provider/provider.dart';

class CommunityDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      bottomNavigationBar: Builder(builder: (BuildContext context) {
        return Container(
          child: button.Button(
            letter: "参加する",
            onPressed: () async{
              var canJoinProject;
              canJoinProject =
                  await Provider.of<GetProjectController>(context, listen: false)
                      .findJoinMembers(
                          project.projectId, project.participantNumber);
              if (canJoinProject) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return ShowModal(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        letter: "プロジェクトに参加しました",
                        buttonLetter: "戻る",
                        innerCircle:
                            Icon(Icons.check, color: Colors.black, size: 45),
                      );
                    });
              } else {
                Scaffold.of(context).showSnackBar(SnackBarComponent(context));
              }
            },
            kind: button.ButtonTheme.Positive,
          ),
        );
      }),
      appBar: AppBar(
        title: Text("Project詳細"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(height: 220),
            child: Container(
              child: Image.network(
                project.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //プロジェクト名
          Container(
            child: Text("プロジェクト名:   " + project.projectName),
          ),
          //日にちと主催者
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.timer),
                  title: Text("開催日:  " + getDateTimeInJapan(project)),
                ),
                Text("参加人数:  " + project.participantNumber.toString())
              ],
            ),
          ),
          //project説明
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Project概要"),
                Text(project.projectExplanation),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(),
    );
  }

  String getDateTimeInJapan(Project project) {
    final String year = project.postDateTime.year.toString();
    final String mounth = project.postDateTime.month.toString();
    final String day = project.postDateTime.day.toString();
    return year + "年" + mounth + "月" + day + "日";
  }
}
