import 'package:cached_network_image/cached_network_image.dart';
import 'package:communitygetandpost/presentation/controller/new_post_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class NewPostPageNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProjectState>(context, listen: true);
    final controller = Provider.of<ProjectController>(context, listen: false);
    if (state.imageFile == null) {
      Future(() => controller.getImage());
    }
    return Scaffold(
      bottomNavigationBar: Container(
        child: RaisedButton(
            color: Colors.amber,
            child: Text("プロジェクトを作成する。"),
            onPressed: () {
              Provider.of<ProjectController>(context, listen: false)
                  .insertProjectToDb()
                  .then((value){
                    print("保存成功");
                    Navigator.pop(context);
                    Navigator.pop(context);
                  })
                  .catchError((error) {
                print("エラー");
              });
            }),
      ),
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
                  constraints: BoxConstraints.expand(height: 200),
                  child: Image.file(
                    state.imageFile,
                    fit: BoxFit.cover,
                  )),
              // child: CachedNetworkImage(
              //   imageUrl: state.imageFile.path,
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              //   fit: BoxFit.cover,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      height: 40,
                    ),
                    Container(
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
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "プロジェクトの開催日を決めてください。",
                            style: TextStyle(color: Colors.black45),
                          ),
                          ListTile(
                            leading: Icon(Icons.calendar_today),
                            title: Text(state.projectOpenTime.toString()),
                            onTap: () {
                              DatePicker.showDateTimePicker(context,
                                  locale: LocaleType.jp,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2030, 12, 9),
                                  onChanged: (dateTime) {
                                print("test");
                              }, onConfirm: (dateTime) {
                                controller.getDatetime(dateTime);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "参加人数を決定してください。",
                            style: TextStyle(color: Colors.black45),
                          ),
                          DropdownButton<int>(
                              value: state.participantNumber,
                              items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                  .map((int number) {
                                return DropdownMenuItem(
                                    value: number,
                                    child: Text(number.toString()));
                              }).toList(),
                              onChanged: (number) {
                                controller.getNumber(number);
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )

            // Text("center"),
          ],
        ),
      ),
    );
  }
}
