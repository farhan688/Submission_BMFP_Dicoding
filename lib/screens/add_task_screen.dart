import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Task Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String taskName = taskController.text.trim();
                if (taskName.isNotEmpty) {
                  Navigator.pop(context, taskName);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
