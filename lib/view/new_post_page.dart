import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:communitygetandpost/presentation/controller/new_post_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectExplanationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final state = Provider.of<ProjectState>(context, listen: false);
    final controller = Provider.of<ProjectController>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RaisedButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "プロジェクトのアイコンを設定する。",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                controller.getNameAndExplanation(projectNameController.text,
                    projectExplanationController.text);
                // controller.getImage();
              }),
        ),
      ),
      appBar: AppBar(
        title: Text("新規プロジェクト"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.black12,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(UserRepository.currentUser.photoUrl),
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "プロジェクトを作成する。",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("目指すところが同じ仲間とプロジェクトを成功させよう。")
                ],
              ),
            ),
            // Container(
            //   child: InkWell(
            //     onTap: () =>
            //         Provider.of<ProjectController>(context, listen: false)
            //             .getImage(),
            //     child: CircleAvatar(
            //       // Provider.of<ProjectState>(context, listen: false).imageFile;
            //       backgroundImage:
            //           Provider.of<ProjectState>(context, listen: false)
            //                       .imageFile ==
            //                   null
            //               ? null
            //               : FileImage(
            //                   Provider.of<ProjectState>(context, listen: true)
            //                       .imageFile),
            //       backgroundColor: Colors.amber,
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("どんなプロジェクトかわかりやすい名前を付けよう。"),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "プロジェクト名",
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextFormField(
                      controller: projectNameController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "プロジェクトの概要",
                      style: TextStyle(color: Colors.black45),
                    ),
                    TextFormField(
                      maxLines: 5,
                      controller: projectExplanationController,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
