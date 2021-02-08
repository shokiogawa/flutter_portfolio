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
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: controller.getCategorizedProject(),
          builder: ((BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        controller: _textController,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text("テクノロジー"),
                ProjectSlideHorizontal(state.mapProject[0]),
                Text("アウトドア"),
                ProjectSlideHorizontal(state.mapProject[1]),
                Text("健康"),
                ProjectSlideHorizontal(state.mapProject[2]),
                Text("スポーツ"),
                ProjectSlideHorizontal(state.mapProject[3]),
                Text("勉強"),
                ProjectSlideHorizontal(state.mapProject[4]),
                Text("外国語"),
                ProjectSlideHorizontal(state.mapProject[5]),
                Text("ボランティア"),
                ProjectSlideHorizontal(state.mapProject[6]),
                Text("ゲーム"),
                ProjectSlideHorizontal(state.mapProject[7]),
                Text("プログラミング"),
                ProjectSlideHorizontal(state.mapProject[8]),
                Text("ビジネス"),
                ProjectSlideHorizontal(state.mapProject[9]),
              ],
            );
          }),
        ),
      ),
    );
  }
}
