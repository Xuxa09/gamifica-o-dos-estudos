import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_habitos/constants.dart';
import 'package:meus_habitos/controllers/addJobs.dart';
import 'package:meus_habitos/controllers/coursesScreen.dart';
import 'package:meus_habitos/controllers/todayJobs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meus_habitos/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Meus Hábitos'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('pt', ''),
          const Locale('es', ''),
          // const Locale.fromSubtags(languageCode: 'zh')
        ]);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: AppColors.select,
          backgroundColor: AppColors.hearderBackground,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.add, size: 20), label: AppLocalizations.of(context)!.addTab),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, size: 20), label: AppLocalizations.of(context)!.today),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, size: 20),
              label: AppLocalizations.of(context)!.courses,
            )
          ]),
      tabBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(child: _buildTab(index)),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTab(int index) {
    switch (index) {
      case 0:
        return Container(
          child: Addjobs(),
        );
      case 1:
        return Container(
          child: Todayjobs(),
        );
      case 2:
        return Container(
          child: Coursesscreen(),
        );
      default:
        return Container(
          child: Todayjobs(),
        );
    }
  }
}
