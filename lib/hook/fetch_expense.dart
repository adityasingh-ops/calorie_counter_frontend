import 'dart:math';

import 'package:fitness/model/expense_model.dart';
import 'package:fitness/model/hook_expense.dart';
import 'package:fitness/model/hook_item.dart';
import 'package:fitness/model/todo_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';

FetchExpense useFetchAllExpense() {
  final allexpense = useState<List<Expense>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);


  Future<void> fetchData() async{
    isLoading.value = true;
    try {
      Uri url = Uri.parse("http://10.0.2.2:5434/expense/");
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        allexpense.value = foodFromJson(response.body);
      } else {
        error.value = Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);
  
  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchExpense(
      data: allexpense.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
