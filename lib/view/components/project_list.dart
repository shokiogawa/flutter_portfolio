import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
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
      _future = Provider.of<GetProjectController>(context, listen: false).getProject(widget.number);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.number.toString());
    // final allProject = Provider.of<GetProjectState>(context, listen: true).allProjects;
    return FutureBuilder(
      future: _future,
      builder:(context , snapshot){
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          print("error");
        }
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
                  return ProjectCard(widget.projects[index]);
                },
                  childCount: widget.projects.length == null ? 0 : widget.projects.length,
                ),
              ),
            )
          ],
        );
      }
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
        Navigator.of(context).pushNamed('/community_detail_page', arguments: project);
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