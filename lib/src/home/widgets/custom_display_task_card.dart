// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/src/shared/models/card_taks_model.dart';

class CustomDisplayCardTask extends StatelessWidget {
  final List<CardTaskModel>? tasksList;

  const CustomDisplayCardTask({
    super.key,
    this.tasksList,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
