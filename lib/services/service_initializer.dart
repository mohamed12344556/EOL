import 'dart:io';



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:high_school/core/local_data/shared_preferences_services.dart';
import 'package:high_school/core/localization/app_localization.dart';
import 'package:high_school/firebase_options.dart';
import 'package:high_school/services/dependency_injection_service.dart';
import 'package:high_school/utils/app_constants.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;
  static Locale locale = const Locale('en');

  initializeSettings() async {
    await initializeDependencyInjection();
    await initializeFirebase();
    String? locale = await sl<SharedPreferencesServices>()
        .getData(key: AppConstants.userStoredLocale, dataType: DataType.string);
    await getSavedLocale();
    if (locale == null) {
      String defaultLocale = Platform.localeName.split('_')[0];
      sl<BaseAppLocalizations>().changeLocale(languageCode: defaultLocale);
    } else {
      sl<BaseAppLocalizations>().changeLocale(languageCode: locale);
    }
  }

  initializeDependencyInjection() async {
    await DependencyInjectionServices().init();
  }

  Future getSavedLocale() async {
    locale = await sl<BaseAppLocalizations>().getUserStoredLocale();
  }

  initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
