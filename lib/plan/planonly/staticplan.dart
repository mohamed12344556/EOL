import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StaticPlan extends StatefulWidget {
  const StaticPlan({super.key});

  @override
  State<StaticPlan> createState() => _StaticPlanState();
}

class _StaticPlanState extends State<StaticPlan> {
  List<Map<String, dynamic>> scheduleData = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    loadScheduleData();
  }

  void loadScheduleData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('scheduleData');
    if (data != null) {
      setState(() {
        scheduleData = List<Map<String, dynamic>>.from(jsonDecode(data));
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        error = 'No data found. Please sync your data first.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'جدول دراسي',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.blue,
        centerTitle: true,
      ),
      backgroundColor: AppColors.bluelight,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
          ? Center(child: Text(error))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: scheduleData.map((data) {
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            data['plans_day'],
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildScheduleRow('الى : من', data['plans_time_1'], 'المادة 1', data['plans_subject_1']),
                    const SizedBox(height: 10),
                    _buildScheduleRow('الى : من', data['plans_time_2'], 'المادة 2', data['plans_subject_2']),
                    const SizedBox(height: 10),
                    _buildScheduleRow('الى : من', data['plans_time_3'], 'المادة 3', data['plans_subject_3']),
                    const SizedBox(height: 10),
                    _buildScheduleRow('الى : من', data['plans_time_4'], 'المادة 4', data['plans_subject_4']),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildScheduleRow(String timeLabel, String time, String subjectLabel, String subject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildScheduleCell(timeLabel, time),
        _buildScheduleCell(subjectLabel, subject),
      ],
    );
  }

  Widget _buildScheduleCell(String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.bluelight,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
