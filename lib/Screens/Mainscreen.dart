import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:toy_project1/HiveModel/HiveModelClass.dart';
import 'package:toy_project1/Screens/NewToDoscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ToDoModel> todolist = []; //ToDoModel 자료형의 list 생성 및 초기화

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  void loadTodos() async {
    var box = await Hive.openBox('todolist');
    setState(() {
      todolist = box.values.toList().cast<ToDoModel>(); //이해 안 됨
    });
  }

  onTapNewToDo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewToDoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        toolbarHeight: 100,
        title: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_outlined, size: 25,),
                SizedBox(width: 10),
                Text("ToDoList", style: TextStyle(fontSize: 25),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: onTapNewToDo, icon: const Icon(Icons.add, size: 30,))
              ],
            )
          ],
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) { //수정 부분
        return ListTile(title: Text(todolist[index].title));
      })
      /*
      const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        child: Column(
          children: [
            ExpansionTile(
              title: Text("오늘의 할 일", style: TextStyle(fontSize: 20)),
              children: [
                Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20,),
            ExpansionTile(
              title: Text("일주일 간 해야할 일", style: TextStyle(fontSize: 20)),
              children: [
                Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20,),
            ExpansionTile(
              title: Text("이번 달의 할 일", style: TextStyle(fontSize: 20)),
              children: [
                Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 100),
            ExpansionTile(
              title: Text("지금 할 일", style: TextStyle(fontSize: 20)),
              children: [
                Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),

       */
    );
  }
}