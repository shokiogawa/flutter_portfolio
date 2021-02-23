import 'package:cached_network_image/cached_network_image.dart';
import 'package:communitygetandpost/presentation/controller/search_project_controller.dart';
import 'package:communitygetandpost/usecase/read_model/project_category.dart';
import 'package:flutter/material.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:provider/provider.dart';

class ProjectSearchDelegate extends SearchDelegate<Project> {
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    final controller = Provider.of<SearchProjectController>(context, listen: false);
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          controller.disposeState();
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final controller = Provider.of<SearchProjectController>(context, listen: false);
    controller.searchProjects(query);
    final projects = Provider.of<SearchProjectState>(context, listen: true).searcedProject;
    return ListView.builder(
      itemCount: projects.length,
        itemBuilder: (context, index){
      return Container(
        child: Row(
          children: [
            //説明文
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(getDateTimeInJapan(projects[index])),
                        Text(projects[index].projectName),
                      ],
                    ),
                    Text(projectCategory[projects[index].categoryId].projectCategoryName)
                  ],
                )),
            Expanded(
                flex: 1,
                child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: 80,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: projects[index].imageUrl,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ))),
          ],
        ),
      );
    });
  }
  String getDateTimeInJapan(Project project) {
    final String year = project.postDateTime.year.toString();
    final String mounth = project.postDateTime.month.toString();
    final String day = project.postDateTime.day.toString();
    return year + "年" + mounth + "月" + day + "日";
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final state = Provider.of<SearchProjectState>(context, listen: true);
    return FutureBuilder(
      future: Provider.of<SearchProjectController>(context, listen: false).searchProjects(query),
      builder: (context, snapshot){
        if(snapshot.connectionState != ConnectionState.done){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError){
          print("error in buildSuggestion");
        }
        return ListView.builder(
            itemCount: state.searcedProject.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                child: Text(state.searcedProject[index].projectName),
              );
            });
      },
    );
  }


}
