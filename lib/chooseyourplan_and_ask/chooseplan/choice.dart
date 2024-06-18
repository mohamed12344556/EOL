import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? selectedAnswer;
  int? time;
  double? reset;
  String? timeStudy;

  List<String> subjects = [
    'لغة عربية',
    'لغة إنجليزية',
    'لغة ثانية',
    'كيمياء',
    'فيزياء',
    'أحياء',
    'جيولوجيا',
    'رياضيات (باحثة)',
    'رياضيات (تطبيقية)',
    'علم نفس واجتماع',
    'تاريخ',
    'جغرافيا',
    'فلسفة ومنطق'
  ];

  List<String> currentSubjects = [];
  Map<String, int?> subjectLevels = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختار'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ما هي الشعبة',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              RadioListTile<String>(
                title: Text('علوم'),
                value: 'علوم',
                groupValue: selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value;
                    updateSubjects(value!);
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('ادبي'),
                value: 'ادبي',
                groupValue: selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value;
                    updateSubjects(value!);
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('رياضة'),
                value: 'رياضة',
                groupValue: selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    selectedAnswer = value;
                    updateSubjects(value!);
                  });
                },
              ),
              SizedBox(height: 20),
              if (selectedAnswer != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'ما هي مدة الدراسة',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    RadioListTile<int>(
                      title: Text('ساعاتان'),
                      value: 2,
                      groupValue: time,
                      onChanged: (value) {
                        setState(() {
                          time = value;
                        });
                      },
                    ),
                    RadioListTile<int>(
                      title: Text('ثلاث ساعات'),
                      value: 3,
                      groupValue: time,
                      onChanged: (value) {
                        setState(() {
                          time = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'ما هي مدة الاستراحة',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    RadioListTile<double>(
                      title: Text('نصف ساعة'),
                      value: 0.5,
                      groupValue: reset,
                      onChanged: (value) {
                        setState(() {
                          reset = value;
                        });
                      },
                    ),
                    RadioListTile<double>(
                      title: Text('ساعة'),
                      value: 1,
                      groupValue: reset,
                      onChanged: (value) {
                        setState(() {
                          reset = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'ما هو وقت الدراسة',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    RadioListTile<String>(
                      title: Text('صباحاً'),
                      value: 'صباحاً',
                      groupValue: timeStudy,
                      onChanged: (value) {
                        setState(() {
                          timeStudy = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('مساءاً'),
                      value: 'مساءاً',
                      groupValue: timeStudy,
                      onChanged: (value) {
                        setState(() {
                          timeStudy = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              if (currentSubjects.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: currentSubjects.map((subject) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'ما مستواك في $subject',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 20),
                        RadioListTile<int>(
                          title: Text('جيد'),
                          value: 0,
                          groupValue: subjectLevels[subject],
                          onChanged: (value) {
                            setState(() {
                              subjectLevels[subject] = value;
                            });
                          },
                        ),
                        RadioListTile<int>(
                          title: Text('ضعيف'),
                          value: 1,
                          groupValue: subjectLevels[subject],
                          onChanged: (value) {
                            setState(() {
                              subjectLevels[subject] = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitAnswer,
                child: Text('Submit Answer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateSubjects(String value) {
    setState(() {
      currentSubjects.clear();
      subjectLevels.clear();
      if (value == 'علوم') {
        currentSubjects.addAll([
          'لغة عربية',
          'لغة إنجليزية',
          'لغة ثانية',
          'كيمياء',
          'فيزياء',
          'أحياء',
          'جيولوجيا',
        ]);
      } else if (value == 'ادبي') {
        currentSubjects.addAll([
          'لغة عربية',
          'لغة إنجليزية',
          'لغة ثانية',
          'علم نفس واجتماع',
          'تاريخ',
          'جغرافيا',
          'فلسفة ومنطق'
        ]);
      } else if (value == 'رياضة') {
        currentSubjects.addAll([
          'لغة عربية',
          'لغة إنجليزية',
          'لغة ثانية',
          'فيزياء',
          'كيمياء',
          'رياضيات (باحثة)',
          'رياضيات (تطبيقية)',
        ]);
      }
    });
  }

  void submitAnswer() async {
    if (selectedAnswer != null && time != null && reset != null && timeStudy != null && subjectLevels.isNotEmpty) {
      var data = {
        'الشعبة': selectedAnswer!,
        'مدة_الدراسة': time!,
        'الاستراحه': reset!,
        'الوقت': timeStudy!,
        'ضعيف_لغه_عربيه': 0,
        'ضعيف_لغه_انجليزيه': 0,
        'ضعيف_لغه_تانيه': 0,
        'ضعيف_كيمياء': 0,
        'ضعيف_فيزياء': 0,
        'ضعيف_احياء': 0,
        'ضعيف_جيولوجيا': 0,
        'ضعيف_رياضيات_باحتة': 0,
        'ضعيف_رياضيات_تطبيقيه': 0,
        'ضعيف_علم_نفس_واجتماع': 0,
        'ضعيف_تاريخ': 0,
        'ضعيف_جغرافيا': 0,
        'ضعيف_فلسفة_ومنطق': 0,
      };

      // إضافة مستويات المواد إلى البيانات
      currentSubjects.forEach((subject) {
        var key = 'ضعيف_' + subject.replaceAll(' ', '_');
        data[key] = subjectLevels[subject] == 0 ? 1 : 0;
      });

      // تحويل البيانات إلى JSON
      String jsonData = jsonEncode(data);

      // طباعة شكل الطلب
      print('Request body: $jsonData');

      var url = Uri.parse('https://predict-3.onrender.com/predict/');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonData,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print('تم إرسال الإجابة بنجاح');
      } else {
        print('فشل في إرسال الإجابة');
      }
    } else {
      print('لم يتم اختيار أي إجابة');
    }
  }

}
