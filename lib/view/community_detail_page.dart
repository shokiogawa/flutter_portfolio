import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/view/components/button.dart' as button;
import 'package:communitygetandpost/view/components/show_modal.dart';
import 'package:communitygetandpost/view/components/snack_bar.dart';
import 'package:communitygetandpost/view/components/user_circle_image.dart';
import 'package:flutter/material.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:provider/provider.dart';

class CommunityDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<GetProjectController>(context, listen: false);
    final Project project = ModalRoute.of(context).settings.arguments;
    // Future(() => controller.getJoinMembers(project.projectId));
    return Scaffold(
      bottomNavigationBar: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: button.Button(
              letter: "参加する",
              onPressed: () async {
                var canJoinProject;
                canJoinProject = await Provider.of<GetProjectController>(
                        context,
                        listen: false)
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
          ),
        );
      }),
      appBar: AppBar(
        title: Text("Project詳細"),
      ),
      body: FutureBuilder(
        future: controller.getJoinMembers(project.projectId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            print("error");
          }
          final joinUsers = Provider.of<GetProjectState>(context, listen: true).joinUser;
          final List<Widget> circlePhotos = joinUsers.map((user) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CirclePhoto(user.photoUrl, 25, false),
          )).toList();
          return Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top:8),
                    child: Text("プロジェクト名"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 10, left: 10),
                    child: Text(project.projectName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  ),
                ],
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
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                          "最大参加人数:  " + project.participantNumber.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          ...circlePhotos
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //project説明
              Divider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("このプロジェクトは何をやるのか??", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                      SizedBox(
                        height: 10,
                      ),
                      Text(project.projectExplanation),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
