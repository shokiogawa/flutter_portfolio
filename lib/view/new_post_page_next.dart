import 'package:cached_network_image/cached_network_image.dart';
import 'package:communitygetandpost/presentation/controller/new_post_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostPageNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProjectState>(context, listen: false);
    final controller = Provider.of<ProjectController>(context, listen: false);
    if (state.imageFile == null) {
      Future(() => controller.getImage());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("新規プロジェクト、詳細決定"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // height: 200,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(
                height: 200
              ),
                child: Image.file(state.imageFile, fit: BoxFit.cover,)),
              // child: CachedNetworkImage(
              //   imageUrl: state.imageFile.path,
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "プロジェクト名",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    state.projectName,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "概要",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    state.projectExplanation,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            )

            // Text("center"),
          ],
        ),
      ),
    );
  }
}
