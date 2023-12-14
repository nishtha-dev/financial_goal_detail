import 'package:flutter/material.dart';

class TabItemModel {
  TabItemModel({
    required this.icon,
    required this.title,
    required this.route,
  });

  final String title;
  final Widget icon;

  final String route;
}
