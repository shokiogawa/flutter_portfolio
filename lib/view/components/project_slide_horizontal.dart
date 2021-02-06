import 'package:cached_network_image/cached_network_image.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/view/components/project_contents.dart';
import 'package:flutter/material.dart';

class ProjectSlideHorizontal extends StatelessWidget {
  final List<Project> projects;

  ProjectSlideHorizontal(this.projects);

  final PageController _pageController = PageController(viewportFraction: 0.6);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Expanded(
        child: PageView.builder(
            itemCount: projects.length,
            controller: _pageController,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ProjectContents(projects[index])
                ),
              );
            }),
      ),
    );
  }
}
