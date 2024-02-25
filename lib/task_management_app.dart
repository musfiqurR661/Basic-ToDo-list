import 'package:flutter/material.dart';
import 'task.dart';
import 'note_list_screen.dart';

class TaskManagementApp extends StatefulWidget {
  const TaskManagementApp({Key? key}) : super(key: key);

  @override
  TaskManagementAppState createState() => TaskManagementAppState();
}

class TaskManagementAppState extends State<TaskManagementApp> {
  final List<Task> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    String title = taskController.text.trim();
    if (title.isNotEmpty) {
      setState(() {
        tasks.add(Task(title));
        taskController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please make a task first.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NotePro',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.yellow[50],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: Colors.yellow[50],
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.red[50],
      body: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: const InputDecoration(
              labelText: 'Enter a new task',
              contentPadding: EdgeInsets.all(10.0),
            ),
            onSubmitted: (value) {
              addTask();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(tasks[index].title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NoteListScreen(task: tasks[index]),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => removeTask(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
