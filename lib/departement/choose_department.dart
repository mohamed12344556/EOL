import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:high_school/Subjects/utils/fonts.dart';
import 'package:high_school/homes/home_literary.dart';
import 'package:high_school/homes/home_mathematics.dart';
import 'package:high_school/homes/home_scientific.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseDepartment extends StatefulWidget {
  const ChooseDepartment({Key? key}) : super(key: key);

  @override
  State<ChooseDepartment> createState() => _ChooseDepartmentState();
}

class _ChooseDepartmentState extends State<ChooseDepartment> {
  @override
  void initState() {
    super.initState();
  }

  void saveDepartment(String department) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('department', department);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bluelight,
      appBar: AppBar(
        backgroundColor: AppColors.bluelight,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'EOL',
          style: TextStyle(
              color: Colors.white,
              fontSize: 70,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontFamily: Appfonts.fontfamilymont),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 450,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Choose your department',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: Appfonts.fontfamilymont),
                  ),
                ),
                const SizedBox(height: 20),
                _buildDepartmentButton(
                  context,
                  'assets/images/microscope.png',
                  'Scientific',
                  () {
                    saveDepartment("علوم");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScientific(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildDepartmentButton(
                  context,
                  'assets/images/tools.png',
                  'Mathematics',
                  () {
                    saveDepartment("رياضة");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeMathematics(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                _buildDepartmentButton(
                  context,
                  'assets/images/books.png',
                  'Literary',
                  () {
                    saveDepartment("ادبي");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeLiterary(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentButton(BuildContext context, String imagePath,
      String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90.0),
      child: Container(
        width: 500,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF102C57)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 80,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
