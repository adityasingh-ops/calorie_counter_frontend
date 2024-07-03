import 'package:fitness/model/todo_model.dart';
import 'package:flutter/material.dart';


class FetchItems{
  final List<Task> ? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchItems({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}