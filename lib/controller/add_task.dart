import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/hook/todo_hook.dart';
import 'package:fitness/model/post_task.dart';
import 'package:fitness/model/post_water.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class AddTask extends GetxController {
  final http.Client httpClient = http.Client();

  get refetch => null;
  // final hookresult = useFetchAllalltask();


  Future<dynamic> submitData(String title, String subtitle) async {
    // Create RequestData object
    RequestData data = RequestData(title: title, subtitle: subtitle);

    // Convert to JSON
    String jsonData = requestDataToJson(data);

    // Example: Send data to server
    Uri url = Uri.parse("http://10.0.2.2:5434/todo/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await httpClient.post(url, headers: headers, body: jsonData);
      print(response.statusCode);

      if (response.statusCode == 201) {
        Get.snackbar(
          "Task Added",
          "Task '${data.title}' added successfully!",
          backgroundColor: TColor.primaryColor1,
          colorText: TColor.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.check_circle,
            color: TColor.white,
          ),
        );
      } else {
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
  Future<dynamic> submitWater(int title,refetch) async {
    // Create RequestData object
    WaterData data = WaterData(amount: title);

    // Convert to JSON
    String jsonData = requestwaterDataToJson(data);
    print(jsonData);
    // Example: Send data to server
    Uri url = Uri.parse("http://10.0.2.2:5434/water/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await httpClient.post(url, headers: headers, body: jsonData);

      if (response.statusCode == 201) {
        refetch();
        Get.snackbar(
          "Task Added",
          "Task '${data.amount}' added successfully!",
          backgroundColor: TColor.primaryColor1,
          colorText: TColor.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.check_circle,
            color: TColor.white,
          ),
        );
      } else {
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
  Future<dynamic> deleteWater(refetch) async {
    // Create RequestData object
    // WaterData data = WaterData(amount: title);

    // Convert to JSON
    // String jsonData = requestwaterDataToJson(data);
    // print(jsonData);
    // Example: Send data to server
    Uri url = Uri.parse("http://10.0.2.2:5434/water/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await httpClient.delete(url, headers: headers,);

      if (response.statusCode == 200) {
        refetch();
        Get.snackbar(
          "Task Added",
          "Task delete successfully!",
          backgroundColor: TColor.primaryColor1,
          colorText: TColor.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(
            Icons.check_circle,
            color: TColor.white,
          ),
        );
      } else {
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
