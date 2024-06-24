
import 'package:flutter/material.dart';
import 'package:high_school/Subjects/sub-lit/views/units_list_view.dart';
import 'package:high_school/Subjects/utils/app_assets.dart';
import 'package:high_school/models/subject_model.dart';

class SubjectViewMath extends StatelessWidget {
  const SubjectViewMath({super.key});

  static const List<SubjectModel> subjects = [
    SubjectModel(title: "English", imgPath: Assets.imagesBooks),
    SubjectModel(title: "Biology", imgPath: Assets.imagesMicroscope),
    SubjectModel(title: "Mathematics", imgPath: Assets.imagesTools),
    SubjectModel(title: "Arabic", imgPath: Assets.imagesContract),
    SubjectModel(title: "Physics", imgPath: Assets.imagesElectricity),
    SubjectModel(title: "Chemistry", imgPath: Assets.imagesChemistry),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 238, 74, 74),
                    Color.fromARGB(255, 219, 204, 73)
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22,
                      )),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hello,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Explore Subjects",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: subjects.length,
                itemBuilder: (context, index) =>
                    _GridItem(item: subjects[index])),
          ],
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem({
    super.key,
    required this.item,
  });

  final SubjectModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UnitsListView(item: item),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 12,
                spreadRadius: 2,
                offset: Offset(8, 8),
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                item.imgPath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
