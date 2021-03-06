import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/usecase/read_model/project_category.dart';
import 'package:communitygetandpost/view/components/project_contents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectListWidget extends StatefulWidget {
  final int number;
  final List<Project> projects;

  // final Project project;

  ProjectListWidget(this.number, this.projects);

  @override
  _ProjectListWidgetState createState() => _ProjectListWidgetState();
}

class _ProjectListWidgetState extends State<ProjectListWidget> {
  Future<void> _future;

  @override
  void initState() {
    _future = Provider.of<GetProjectController>(context, listen: false)
        .getProject(widget.number);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.number.toString());
    // final allProject = Provider.of<GetProjectState>(context, listen: true).allProjects;
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print("エラー");
          }
          return ListView.builder(
              itemCount: widget.projects.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/community_detail_page', arguments: widget.projects[index]);
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(0.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            getDateTimeInJapan(widget.projects[index]),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        )),
                                    Card(
                                      elevation: 2,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blueGrey
                                              )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(projectCategory[
                                            widget.projects[index].categoryId]
                                                .projectCategoryName),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.projects[index].projectName,
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Text(
                                        widget.projects[index].projectExplanation,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.orange,

                      ),
                    ],
                  ),
                );
              });
          //   CustomScrollView(
          //   cacheExtent: 500,
          //   key: PageStorageKey(widget.number),
          //   slivers: [
          //     SliverPadding(
          //       padding: const EdgeInsets.all(10.0),
          //       sliver: SliverGrid(
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           crossAxisSpacing: 2,
          //           mainAxisSpacing: 2,
          //           childAspectRatio: 0.75,
          //         ),
          //         delegate:
          //         SliverChildBuilderDelegate((BuildContext context, int index) {
          //           return ProjectCard(widget.projects[index]);
          //         },
          //           childCount: widget.projects.length == null ? 0 : widget.projects.length,
          //         ),
          //       ),
          //     )
          //   ],
          // );
        });
  }

  String getDateTimeInJapan(Project project) {
    final String year = project.postDateTime.year.toString();
    final String mounth = project.postDateTime.month.toString();
    final String day = project.postDateTime.day.toString();
    return year + "年" + mounth + "月" + day + "日";
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard(this.project);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/community_detail_page', arguments: project);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(children: <Widget>[
            ProjectContents(project),
            // ...item.tags.map((tag) => Tag(TagTheme.RED, tag)).toList(),
          ])),
    );
  }
}
