import 'package:fitness/controller/task_controller.dart';
import 'package:fitness/hook/todo_hook.dart';
import 'package:fitness/model/todo_model.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TaskPage extends HookWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TaskController());
    final hookResult = useFetchAllalltask();
    final List<Task>? tasks = hookResult.data;
    final refetch = hookResult.refetch;
    if (tasks == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Tasks'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.subtitle),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  controller.updateid = task.id;
                  controller.deletetask(controller.id, refetch!);
                  // Call your delete task function here
                  //await deleteTask(task.id);
                  // Refresh the task list after deletion
                  //hookResult.refresh();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}