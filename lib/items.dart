import 'package:flutter/material.dart';
import 'todo.dart';

List<ToDo> tasks = ToDo.todoList();
int taskCount = 2;

class toDoitems extends StatefulWidget {
  const toDoitems({super.key});

  @override
  State<toDoitems> createState() => _toDoitemsState();

  static void _setState() {}
}

class _toDoitemsState extends State<toDoitems> {
  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'ALL TASKs',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(7),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  tileColor: Colors.white,
                  leading: IconButton(
                    icon: tasks[index].isComplete
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onPressed: () {
                      setState(() {
                        tasks[index].isComplete ^= true;
                      });
                    },
                  ),
                  title: Text(
                    '${tasks[index].todoText}',
                    style: TextStyle(
                        fontSize: 18,
                        decoration: tasks[index].isComplete
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Confarmation'),
                          content: const Text('Delete the task?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  tasks.removeAt(index);
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text('Delete'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 500,
                    child: Column(
                      children: [
                        TextField(
                          controller: input,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Task name',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            tasks.add(
                                ToDo(id: taskCount++, todoText: input.text));
                            input.text = "";
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('Add'),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(5),
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
