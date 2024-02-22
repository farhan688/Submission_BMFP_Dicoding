import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '/models/task.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(name: taskName, isCompleted: false));
    });
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
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
        title: Text('To-Do List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Swipe to Delete Task',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            tasks.isEmpty
                ? Center(
                    child: Text(
                      'No tasks yet!',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(tasks[index].name),
                        onDismissed: (direction) {
                          removeTask(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${tasks[index].name} dismissed'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  setState(() {
                                    tasks.insert(index, tasks[index]);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete, color: Colors.white),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 16.0),
                        ),
                        child: ListTile(
                          title: Text(
                            tasks[index].name,
                            style: TextStyle(
                              decoration: tasks[index].isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          leading: Checkbox(
                            value: tasks[index].isCompleted,
                            onChanged: (value) {
                              toggleTaskStatus(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (result != null) {
            addTask(result as String);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
