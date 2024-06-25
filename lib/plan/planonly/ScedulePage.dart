import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SchedulePage extends StatefulWidget {
  final int planNumber;
  final String selectedAnswer;
  final int time;
  final double reset;
  final String timeStudy;
  final Map<String, int?> subjectLevels;

  SchedulePage({
    required this.planNumber,
    required this.selectedAnswer,
    required this.time,
    required this.reset,
    required this.timeStudy,
    required this.subjectLevels,
  });

  static List<Map<String, dynamic>> scheduleData = [];

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchScheduleData();
  }

  void fetchScheduleData() async {
    try {
      int planNumber = widget.planNumber;
      var url = Uri.parse('http://192.168.1.5:8080/eol/plans/view.php');
      var response = await http.post(
        url,
        body: {
          "plan_num": planNumber.toString(),
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        setState(() {
          SchedulePage.scheduleData =
              List<Map<String, dynamic>>.from(responseData['data']);
          isLoading = false;
        });
        saveScheduleData(responseData['data']);
      } else {
        print('Failed to load schedule data: ${response.body}');
        setState(() {
          isLoading = false;
          error = 'Failed to load data. Please try again later.';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
        error = 'Error occurred. Please check your internet connection.';
      });
    }
  }

  void saveScheduleData(List<dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('scheduleData', jsonEncode(data));
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
              ? Center(
                  child: Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 565,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 40.0,
                        dataRowHeight: 70,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'الوقت/اليوم',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'الى : من',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'المادة 1',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'الى : من',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'المادة 2',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'الى : من',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'المادة 3',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'الى : من',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'المادة 4',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                        rows: SchedulePage.scheduleData.map((data) {
                          return DataRow(cells: [
                            DataCell(
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    data['plans_day'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_time_1'],
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_subject_1'],
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_time_2'],
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_subject_2'],
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_time_3'],
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_subject_3'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_time_4'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: AppColors.bluelight.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    data['plans_subject_4'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
    );
  }
}
