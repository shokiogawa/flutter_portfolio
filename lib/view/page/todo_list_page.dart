import 'package:flutter/material.dart';

class TODO {
  final String title;
  final String subTitle;

  TODO(this.title, this.subTitle);
}

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<TODO> toDos = [
    TODO("test1", "subtest1"),
    TODO("test2", "subtest2"),
    TODO("test3", "subtest3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOリスト"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.orange,
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  setState(() {
                    final TODO todo = toDos.removeAt(oldIndex);
                    toDos.insert(newIndex, todo);
                  });
                  print(toDos[newIndex].title);
                },
                children: [
                  for (final item in toDos)
                    ListTile(
                      key: ValueKey(item),
                      title: Text(item.title),
                    )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Draggable(
                  onDragStarted: (){
                    print("statrt");
                  },
                  onDragCompleted: (){
                    print("complete");
                  },
                  onDragEnd: (detail){
                    print("end");

                  },
                    child: Container(
                      color: Colors.blue,
                      width: 50,
                    ),
                    feedback: Container(
                      color: Colors.blue,
                      height: 50,
                    ),
                childWhenDragging: Container(
                  width: 50,
                  color: Colors.blue.withOpacity(0.5),
                ),),
              ))
        ],
      ),
    );
  }
}
