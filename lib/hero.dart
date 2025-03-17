import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeroTest extends StatelessWidget {
  const HeroTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Hero(tag: "Add", child: Icon(Icons.work_off, size: 250)),
        ),
      ),
    );
  }
}
