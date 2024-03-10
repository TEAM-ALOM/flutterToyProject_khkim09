import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toy_project1/Screens/NewToDoscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  onTapNewToDo() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewToDoScreen()));
  }

  bool isToggledOff = true;
  toggle() {
    setState(() {
      isToggledOff = !isToggledOff;
    });
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
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
    );
  }
}
