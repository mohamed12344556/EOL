
import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_assets.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';

class UnitView extends StatelessWidget {
  const UnitView({super.key, required this.index});

  final int index;
  static const List<String> unitItemTitles = [
    "Book",
    "Quiz",
    
  ];
  static const List<IconData> unitItemIcons = [
    Icons.book,
    Icons.question_mark,
   
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_sharp)),
                  SizedBox(width: 8),
                  Text(
                    "Unit $index",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    Assets.imagesVideo,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Column(
                    children: List.generate(
                        unitItemTitles.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: CustomUnitItem(
                                icon: unitItemIcons[index],
                                title: unitItemTitles[index],
                              ),
                            )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomUnitItem extends StatelessWidget {
  const CustomUnitItem({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.yellow,
          radius: 24,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
