import 'package:fitness/model/expense_model.dart';
import 'package:flutter/material.dart';


class FetchExpense{
  final List<Expense> ? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchExpense({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}