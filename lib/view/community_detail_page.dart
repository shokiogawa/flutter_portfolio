import 'package:flutter/material.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';

class CommunityDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;
    return Scaffold(
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

  String getDateTimeInJapan(Project project){
    final String year = project.postDateTime.year.toString();
    final String mounth = project.postDateTime.month.toString();
    final String day = project.postDateTime.day.toString();
    return year + "年" + mounth + "月" + day + "日";
  }
}
