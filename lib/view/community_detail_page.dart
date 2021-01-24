import 'package:flutter/material.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';


class CommunityDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //プロジェクト名
          Container(),
          //日にちと主催者
          Container(),
          //project説明
          Container(),
        ],
      ),
      bottomNavigationBar: Container(),
    );
  }
}
