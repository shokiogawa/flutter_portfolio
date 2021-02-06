import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/view/components/project_contents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectSlideHorizontal extends StatelessWidget {
  final List<Project> projects;
  ProjectSlideHorizontal(this.projects);

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowWidget = projects
        .map((project) =>
            Container(width: 200,height: 250, child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ProjectContents(project),
            )))
        .toList();
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...rowWidget
          ],
        ));
  }
}
