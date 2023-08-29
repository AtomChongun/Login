import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Logincomplete extends StatelessWidget {
  const Logincomplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text(
          "login Complete",
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
