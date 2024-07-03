import 'dart:ui';

class FetchHook{
  final dynamic data;
  final bool isLoading;
  final VoidCallback? refetch;

  FetchHook({required this.data, required this.isLoading, this.refetch});
}