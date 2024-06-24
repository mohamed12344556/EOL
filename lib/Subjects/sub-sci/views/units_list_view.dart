
import 'package:flutter/material.dart';
import 'package:high_school/Subjects/sub-lit/views/unit_view.dart';
import 'package:high_school/models/subject_model.dart';

class UnitsListView extends StatelessWidget {
  const UnitsListView({super.key, required this.item});

  final SubjectModel item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
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
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "0/100",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20),
            itemCount: 12,
            itemBuilder: (context, index) => _UnitItem(index: index + 1),
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
          ))
        ],
      ),
    ));
  }
}

class _UnitItem extends StatelessWidget {
  const _UnitItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UnitView(
                index: index,
              ),
            ));
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
            )),
        child: Row(
          children: [
            Text(
              "Unit-$index :",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "0/100",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
