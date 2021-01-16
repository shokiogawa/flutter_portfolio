import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:communitygetandpost/usecase/read_model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  final List<Category> categories = [
    Category(
        categoryId: 1, categoryName: "おすすめ", categoryEnglish: "recommended"),
    Category(
        categoryId: 2, categoryName: "参加プロジェクト", categoryEnglish: "myproject"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => Provider.of<LoginPageController>(context,
                  listen: false)
              .logOut()
              .then((value) => Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login_page", (route) => false)),
        ),
        title: Text("HOME"),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: categories.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "マイプロジェクト",
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              child: Text(
                                "プロジェクトを作成する。",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                              onTap: () => Navigator.of(context)
                                  .pushNamed("/new_post_page"),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            child: Text(
                              "あなたのスケジュール",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxScrolled,
                bottom: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.blueGrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: categories[0].categoryName),
                    Tab(text: categories[1].categoryName)
                  ],
                ),
              ),
            ];
          },
          // slivers: [
          //   SliverAppBar(
          //     expandedHeight: 100,
          //     backgroundColor: Colors.white,
          //     flexibleSpace: Container(
          //       padding: EdgeInsets.only(top: 20),
          //       margin: EdgeInsets.symmetric(horizontal: 15),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text("マイプロジェクト", style: TextStyle(fontSize: 18),),
          //               InkWell(
          //                 child: Text(
          //                   "プロジェクトを作成する。",
          //                   style: TextStyle(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w600,
          //                       color: Colors.blue),
          //                 ),
          //                 onTap: () => Navigator.of(context).pushNamed("/new_post_page"),
          //               )
          //             ],
          //           ),
          //           Container(
          //             child: Text("あなたのスケジュール", style: TextStyle(fontSize: 20),),
          //           )
          //         ],
          //       ),
          //     ),
          //     pinned: true,
          //     floating: true,
          //   ),
          //   SliverList(
          //     delegate: SliverChildListDelegate([
          //       Container(
          //         child: Column(
          //           children: [
          //             RaisedButton(
          //               child: Text("ログアウト"),
          //               onPressed: () => Provider.of<LoginPageController>(context,
          //                       listen: false)
          //                   .logOut()
          //                   .then((value) => Navigator.of(context)
          //                       .pushNamedAndRemoveUntil(
          //                           "/login_page", (route) => false)),
          //             ),
          //             Text("HOMEです。"),
          //           ],
          //         ),
          //       ),
          //     ]),
          //   )
          // ],
          body: TabBarView(children: [Text("おすすめ"), Text("Myプロジェクト")]),
        ),
      ),
    );
  }
}
