
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/model/post_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:fitness/model/todo_model.dart';
import 'package:http/http.dart' as http;


class TaskController extends GetxController {
  final http.Client httpClient = http.Client();
  var tasks = <Task>[].obs;
  RxString _id = ''.obs;

    String get id => _id.value;

    set updateid(String value) {
      _id.value = value;
    }

  void updateTasks(List<Task> newTasks) {
    tasks.assignAll(newTasks);
  }

  double get completedRatio {
    int completedTasks = tasks.where((task) => task.completed).length;
    if(completedTasks == 0) return 0;
    return completedTasks / tasks.length;
  }

  void toggleTaskCompletion(int index) {
    tasks[index].completed = !tasks[index].completed;
    tasks.refresh(); // Notify listeners
   
  }
    Future<dynamic> updatetask(String id, refetch) async {
    // Create RequestData object
    // RequestData data = RequestData(title: title, subtitle: subtitle);

    // Convert to JSON
    // String jsonData = requestDataToJson(data);

    // Example: Send data to server
    Uri url = Uri.parse("http://10.0.2.2:5434/todo/$id");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await httpClient.patch(url, headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200) {
        refetch();
        Get.snackbar(
          "Task Completed",
          "Task completed successfully!",
          backgroundColor: TColor.primaryColor1,
          colorText: TColor.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.check_circle,
            color: TColor.white,
          ),
        );
      } else if(response.statusCode == 500) {
         print("Error: ${response.reasonPhrase}, ${response.body}");
        Get.snackbar(
         
          "Error",
          "Failed to add task. Please try again later.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        "Error",
        "Failed to connect to server. Please check your internet connection.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      );
    }
  }
   Future<dynamic> deletetask(String id, refetch) async {
    // Create RequestData object
    // RequestData data = RequestData(title: title, subtitle: subtitle);

    // Convert to JSON
    // String jsonData = requestDataToJson(data);

    // Example: Send data to server
    Uri url = Uri.parse("http://10.0.2.2:5434/todo/$id");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await httpClient.delete(url, headers: headers);
      print(response.statusCode);

      if (response.statusCode == 200) {
        refetch();
        Get.snackbar(
          "Task Deleted",
          "Task completed successfully!",
          backgroundColor: Colors.red,
          colorText: TColor.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.check_circle,
            color: TColor.white,
          ),
        );
      } else if(response.statusCode == 500) {
         print("Error: ${response.reasonPhrase}, ${response.body}");
        Get.snackbar(
         
          "Error",
          "Failed to add task. Please try again later.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
        "Error",
        "Failed to connect to server. Please check your internet connection.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  void dispose() {
    httpClient.close();
    super.dispose();
  }
}
