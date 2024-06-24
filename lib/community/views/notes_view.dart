

import 'package:flutter/material.dart';

import 'package:high_school/community/utils/app_constants.dart';
import 'package:high_school/core/localization/app_localization.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_back_ios_sharp),
                const SizedBox(width: 8),
                Text(
                  tr(AppConstants.notesTxt),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              "${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
             Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                CustomTextFormEditing(
                  textSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  hintText: tr(AppConstants.titleTxt),
                ),
                CustomTextFormEditing(
                  textSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  maxLines: 20,
                  hintText: tr(AppConstants.noteSomthingDown),
                ),
              ],
            )))
          ],
        ),
      ),
    );
  }
}

class CustomTextFormEditing extends StatelessWidget {
  const CustomTextFormEditing({
    super.key,
    required this.textSize,
    required this.fontWeight,
    required this.color,
    this.maxLines = 1,
    required this.hintText,
  });

  final double textSize;
  final FontWeight fontWeight;
  final Color? color;
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}
