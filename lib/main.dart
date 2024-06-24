import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:high_school/chooseyourplan_and_ask/ASK/ASK_PDF_URL.dart';
import 'package:high_school/chooseyourplan_and_ask/ASK/chat_pdf.dart';
import 'package:high_school/chooseyourplan_and_ask/chooseplan/choice.dart';
import 'package:high_school/chooseyourplan_and_ask/chooseyourplan_and_ask.dart';
import 'package:high_school/core/localization/language_translation.dart';
import 'package:high_school/departement/choose_department.dart';
import 'package:high_school/homes/home_literary.dart';
import 'package:high_school/homes/home_mathematics.dart';
import 'package:high_school/homes/home_scientific.dart';
import 'package:high_school/login/sign/login.dart';
import 'package:high_school/plan/note/addnote.dart';
import 'package:high_school/plan/note/editenote.dart';
import 'package:high_school/plan/note/yournote.dart';
import 'package:high_school/services/service_initializer.dart';
import 'package:high_school/views/community/views/community_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharepref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('ar')],
        fallbackLocale: ServiceInitializer.locale,
        translations: LanguageTranslation(),
        initialRoute:
             sharepref.getString("id") == null ? "login" : "home_mathematics",
        // "choose_department",
        routes: {
          "addnote": (context) => const addnote(),
          "editenote": (context) => const EditNote(),
          "chooseplan_and_ask": (context) => const ChoicePlanAsk(),
          "login": (context) => const Login(),
          "chooseplan": (context) => ChoicePlan(),
          "chatpdf": (context) => const ChatPage1(),
          "choose_department": (context) => const ChooseDepartment(),
          "home_scientific": (context) => HomeScientific(),
          "home_mathematics": (context) => HomeMathematics(),
          "home_literary": (context) => HomeLiterary(),
          "AskPage": (context) => const Ask_Page(),
          "community": (context) => const CommunityView(),
          "Ur_Notes": (context) => const YourNote(),
        });
  }
}
