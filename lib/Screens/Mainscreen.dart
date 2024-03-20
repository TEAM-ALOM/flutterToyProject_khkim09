import 'package:flutter/material.dart';
import 'package:toy_project1/Screens/NewToDoscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List todoList = [];

  Future<void> onTapNewToDo() async {
    var todoData = await Navigator.push(context, MaterialPageRoute(builder: (context) => const NewToDoScreen()));
    if (todoData != null) {
      setState(() {
        todoList.add(todoData); //list에 추가
      });
    }
  }

  void del(int index) {
    setState(() {
      todoList.removeAt(index);
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpansionTile(
                title: const Text("오늘의 할 일", style: TextStyle(fontSize: 20)),
                children: [
                  if (todoList.isEmpty)
                    const Center(
                      child: Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(todoList[index], style: const TextStyle(fontSize: 18),),
                              IconButton(onPressed: () => del(index), icon: const Icon(Icons.delete), iconSize: 18,)
                            ]
                          ),
                        );
                      }
                    )
                ],
              ),
              const SizedBox(height: 20,),
              ExpansionTile(
                title: const Text("일주일 간 해야할 일", style: TextStyle(fontSize: 20)),
                children: [
                  if (todoList.isEmpty)
                    const Center(
                      child: Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
                    )
                  else
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 20, 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(todoList[index], style: const TextStyle(fontSize: 18),),
                                  IconButton(onPressed: () => del(index), icon: const Icon(Icons.delete), iconSize: 18,)
                                ]
                            ),
                          );
                        }
                    )
                ],
              ),
              const SizedBox(height: 20,),
              ExpansionTile(
                title: const Text("이번 달의 할 일", style: TextStyle(fontSize: 20)),
                children: [
                  if (todoList.isEmpty)
                    const Center(
                      child: Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
                    )
                  else
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 20, 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(todoList[index], style: const TextStyle(fontSize: 18),),
                                  IconButton(onPressed: () => del(index), icon: const Icon(Icons.delete), iconSize: 18,)
                                ]
                            ),
                          );
                        }
                    )
                ],
              ),
              const SizedBox(height: 100),
              ExpansionTile(
                title: const Text("지금 할 일", style: TextStyle(fontSize: 20)),
                children: [
                  if (todoList.isEmpty)
                    const Center(
                      child: Text("할 일을 작성해주세요!", style: TextStyle(fontSize: 18)),
                    )
                  else
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 20, 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(todoList[index], style: const TextStyle(fontSize: 18),),
                                  IconButton(onPressed: () => del(index), icon: const Icon(Icons.delete), iconSize: 18,)
                                ]
                            ),
                          );
                        }
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}