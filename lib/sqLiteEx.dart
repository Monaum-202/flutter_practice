import 'package:flutter/material.dart';
import 'package:test_app/models/Task.dart';
import 'helpers/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite CRUD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListPage(),
    );
  }
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late Future<List<Task>> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = DatabaseHelper.instance.queryAllTasks();
  }

  _addTask() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Add Task'),
            content: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    Task task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                    );
                    DatabaseHelper.instance.insert(task);
                    setState(() {
                      _tasks = DatabaseHelper.instance.queryAllTasks();
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  _editTask(Task task) async {
    TextEditingController titleController = TextEditingController(
      text: task.title,
    );
    TextEditingController descriptionController = TextEditingController(
      text: task.description,
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Edit Task'),
            content: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    Task updatedTask = Task(
                      id: task.id,
                      title: titleController.text,
                      description: descriptionController.text,
                    );
                    DatabaseHelper.instance.update(updatedTask);
                    setState(() {
                      _tasks = DatabaseHelper.instance.queryAllTasks();
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  _deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    setState(() {
      _tasks = DatabaseHelper.instance.queryAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite CRUD App')),
      body: FutureBuilder<List<Task>>(
        future: _tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }

          List<Task> tasks = snapshot.data!;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                onTap: () => _editTask(task),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(task.id!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
