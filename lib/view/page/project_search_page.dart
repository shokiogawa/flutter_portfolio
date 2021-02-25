import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/presentation/controller/search_project_controller.dart';
import 'package:communitygetandpost/usecase/read_model/project_category.dart';
import 'package:communitygetandpost/view/components/project_slide_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:communitygetandpost/view/components/project_search_delegate.dart';

class ProjectSearchPage extends StatefulWidget {
  @override
  _ProjectSearchPageState createState() => _ProjectSearchPageState();
}

class _ProjectSearchPageState extends State<ProjectSearchPage> {
  Future _future;
  List<Widget> columnWidget;

  @override
  void initState() {
    _future = Provider.of<GetProjectController>(context, listen: false)
        .getCategorizedProject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<GetProjectState>(context, listen: true);
    final TextEditingController _textController = TextEditingController();
    final controller =
        Provider.of<SearchProjectController>(context, listen: false);
    final List<Widget> eachDay = [
      Text("今日",),
      Text("明日"),
      Text("今週"),
      Text("今週末"),
      Text("来週"),
      Text("開催予定の全プロジェクト")
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.search, color: Colors.black),
        title: InkWell(
          splashColor: Colors.white30,
          onTap: () async {
            final selectProject = await showSearch(
              context: context,
              delegate: ProjectSearchDelegate(),
            );
          },
          child: Text(
            "検索",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _future,
          builder: ((BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            columnWidget = projectCategory
                .map((category) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            category.projectCategoryName,
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ProjectSlideHorizontal(state.mapProject[category.id]),
                        Divider()
                      ],
                    ))
                .toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Find event near"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.location.city),
                              Row(
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.sync),
                                      onPressed: () {
                                        print("test");
                                      }),
                                  Text("change area")
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3,
                                          crossAxisCount: 2),
                                  itemCount: eachDay.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black26)
                                      ),
                                        child: Center(child: eachDay[index]));
                                  })),
                        ],
                      ),
                      height: 250,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "カテゴリー別プロジェクト",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [...columnWidget],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
