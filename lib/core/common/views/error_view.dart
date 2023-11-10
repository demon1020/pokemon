import 'package:flutter/material.dart';
import 'package:go_router/src/misc/errors.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required GoException? error});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Page Not Found'),
      ),
    );
  }
}
