import 'dart:io';

import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:communitygetandpost/usecase/read_model/category.dart';
import 'package:communitygetandpost/view/components/project_contents.dart';
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
        categoryId: 2, categoryName: "参加プロジェクト", categoryEnglish: "myproject"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Tab>_buildTabs = categories.map((category) => Tab(text: category.categoryName)).toList();
    List<Widget> _buildWidget = categories.map((category) => ProjectListWidget(category.categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => Provider.of<LoginPageController>(context,
                  listen: false)
              .logOut()
              .then((value) => Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login_page", (route) => false)),
        ),
        title: Text("HOME"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: categories.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
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
                                "プロジェクトを作成する。",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                              onTap: () => Navigator.of(context)
                                  .pushNamed("/new_post_page"),
                            )
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
                  onTap: (value) {
                    if(value == 0){
                      Provider.of<GetProjectController>(context, listen: false)
                          .getProject();
                    }
                  },
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
            ..._buildWidget
          ],),
        ),
      ),
    );
  }
}

class ProjectListWidget extends StatefulWidget {
  final int number;
  // final Project project;

  ProjectListWidget(this.number);

  @override
  _ProjectListWidgetState createState() => _ProjectListWidgetState();
}

class _ProjectListWidgetState extends State<ProjectListWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.number.toString());
    final allProject = Provider.of<GetProjectState>(context, listen: true).allProjects;
    return CustomScrollView(
      key: PageStorageKey(widget.number),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.75,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ProjectCard(allProject[index]);
            },
            childCount: allProject.length,
            ),
          ),
        )
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  ProjectCard(this.project);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(children: <Widget>[
            ProjectContents(project),
            // ...item.tags.map((tag) => Tag(TagTheme.RED, tag)).toList(),
          ])),
    );;
  }
}
