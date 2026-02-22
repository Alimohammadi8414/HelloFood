import 'package:flutter/material.dart';

class Topmenuedetail extends StatelessWidget {
  final int index;
  final String name;
  const Topmenuedetail({required this.index, required this.name, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Menu Detail',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text('THIS IS "$name" DETAILS SCREEN')),
      ),
    );
  }
}
