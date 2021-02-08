import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:communitygetandpost/presentation/controller/new_post_page_controller.dart';
import 'package:communitygetandpost/usecase/read_model/project_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectExplanationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProjectState>(context, listen: true);
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
                controller.getImage().then((value) =>
                    Navigator.of(context).pushNamed('/new_post_page_next'));
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ジャンルを選択する", style: TextStyle(color: Colors.black45),),
                    SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 3,
                      children:
                          List<Widget>.generate(projectCategory.length, (int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ChoiceChip(
                            labelPadding: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.grey
                                ),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            selectedColor: Colors.red.withOpacity(0.7),
                            backgroundColor: Colors.white,
                            onSelected: (bool isSelected){
                              controller.getCategory(projectCategory[index]);
                            },
                              label: Text(projectCategory[index].projectCategoryName, style: TextStyle(color: Colors.blueGrey),),
                              selected: state.projectCategory.id == index),
                        );
                      }),
                    ),
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
