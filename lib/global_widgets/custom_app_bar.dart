import 'package:flutter/material.dart';
import 'package:lms_app/utils/assets_manager.dart';

PreferredSizeWidget customAppBar ({
  String? title,
}) {
  return AppBar(
    title: Row(
      children: [
        Image.asset(ImageManager.logo, width: 100,)
      ],
    ),
  );
}