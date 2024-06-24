
import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_assets.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:high_school/models/subject_model.dart';

class MathView extends StatelessWidget {
  const MathView({super.key});

  static const List<SubjectModel> subjects = [
    SubjectModel(title: "Algebra", imgPath: Assets.imagesBooks),
    SubjectModel(title: "Dynamics", imgPath: Assets.imagesBooks),
    SubjectModel(title: "Statics", imgPath: Assets.imagesBooks),
    SubjectModel(title: "Calculus ", imgPath: Assets.imagesBooks),
    SubjectModel(title: "Integration ", imgPath: Assets.imagesBooks),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_sharp)),
                const Spacer(),
                const Text(
                  "Mathematics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 46,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: subjects.length,
                itemBuilder: (context, index) =>
                    CustomSubjectItem(item: subjects[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSubjectItem extends StatelessWidget {
  const CustomSubjectItem({super.key, required this.item});

  final SubjectModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(item.imgPath),
              SizedBox(
                width: 10,
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
