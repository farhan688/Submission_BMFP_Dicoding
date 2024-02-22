import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: _keyboardHeight(context)),
            ],
          ),
        ),
      ),
    );
  }

  double _keyboardHeight(BuildContext context) {
    // Mengambil tinggi keyboard
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    
    // Jika keyboardHeight lebih kecil dari 0, set ke 0
    return keyboardHeight > 0 ? keyboardHeight : 0;
  }
}
