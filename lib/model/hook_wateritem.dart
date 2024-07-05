import 'package:fitness/model/water_model.dart';
import 'package:flutter/material.dart';


class FetchWater{
  final List<Transaction> ? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchWater({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}