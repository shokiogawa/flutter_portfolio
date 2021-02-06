import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/view/components/project_slide_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GetProjectController>(context, listen: false);
    final state = Provider.of<GetProjectState>(context, listen: true);
    final TextEditingController _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("プロジェクト検索"),
      ),
      body: FutureBuilder(
        future: controller.getProject(0),
        builder: ((BuildContext context, AsyncSnapshot snapshot){
          return Column(
            children: [
              TextField(
                controller: _textController,
              ),
              ProjectSlideHorizontal(state.allProjects),
            ],
          );
        }),
      ),
    );
  }
}
