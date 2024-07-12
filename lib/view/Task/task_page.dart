import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/controller/task_controller.dart';
import 'package:fitness/hook/todo_hook.dart';
import 'package:fitness/model/todo_model.dart';
import 'package:fitness/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
              title: Text(
                      task.title,
                      style: TextStyle(
                          color: TColor.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
              subtitle: Text(
                      task.subtitle,
                      style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                      ),
                    ),
              trailing: GestureDetector(
              onTap: () {
                controller.deletetask(controller.id, refetch!);
              },
              child: Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    MaterialCommunityIcons.trash_can,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ),
            );
          },
        ),
      ),
    );
  }
}