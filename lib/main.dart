import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:new_project1/state/user_find_drug_store_controller.dart';
import 'package:new_project1/ui/pages/login_page/user_login_page.dart';
import 'package:new_project1/ui/pages/user_pages/user_find_drug_store/user_find_drug_store.dart';
import 'package:new_project1/ui/pages/user_pages/user_main_page/user_main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eczanem',
      locale: const Locale('tr', 'TR'),
      supportedLocales: const [Locale('tr', 'TR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: FindDrugStore(),
    );
  }
}
