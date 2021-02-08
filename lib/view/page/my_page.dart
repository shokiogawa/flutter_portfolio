import 'dart:io';

import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:communitygetandpost/presentation/controller/new_post_page_controller.dart';
import 'package:communitygetandpost/usecase/read_model/category.dart';
import 'package:communitygetandpost/view/components/project_contents.dart';
import 'package:communitygetandpost/view/components/project_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Category> categories = [
    Category(
        categoryId: 1, categoryName: "おすすめ", categoryEnglish: "recommended"),
    Category(
        categoryId: 2, categoryName: "企画プロジェクト", categoryEnglish: "myproject"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Tab>_buildTabs = categories.map((category) =>
        Tab(text: category.categoryName)).toList();
    // List<Widget> _buildWidget = categories.map((category) => ProjectListWidget(category.categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () =>
              Provider.of<LoginPageController>(context,
                  listen: false)
                  .logOut()
                  .then((value) =>
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                      "/login_page", (route) => false)),
        ),
        title: Text("HOME"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: categories.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            final controller = Provider.of<ProjectController>(context, listen: false);
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "マイプロジェクト",
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                                child: Text(
                                  "プロジェクトを作成する",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                                onTap: () {
                                  // controller.initState();
                                  Navigator.of(context)
                                      .pushNamed("/new_post_page");
                                })
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            child: Text(
                              "あなたのスケジュール",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxScrolled,
                bottom: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.blueGrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    ..._buildTabs,
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            ProjectListWidget(0, Provider
                .of<GetProjectState>(context, listen: true)
                .allProjects),
            ProjectListWidget(1, Provider
                .of<GetProjectState>(context, listen: true)
                .myProject)

            // ..._buildWidget
          ],),
        ),
      ),
    );
  }
}


