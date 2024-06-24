

import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:high_school/community/utils/app_constants.dart';
import 'package:high_school/core/localization/app_localization.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

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
                  tr(AppConstants.quizTxt),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Center(
                  child: Text(
                    tr(AppConstants.areYouReady),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "${index + 1} ${tr(AppConstants.questions)}",
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Text(
                        tr(AppConstants.okay),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
