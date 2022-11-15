import 'package:flutter/material.dart';

class GlobalLoadingWidget extends StatelessWidget {
  const GlobalLoadingWidget({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
