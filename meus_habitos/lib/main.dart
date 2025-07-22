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
  late PageController _pagecontroler;
  int currentIndex = 1;
  void onTabChange(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pagecontroler = PageController(initialPage: 1);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pagecontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottom(),
      // bottomNavigationBar: CupertinoTabBar(
      //     activeColor: AppColors.select,
      //     currentIndex: currentIndex,
      //     backgroundColor: AppColors.hearderBackground,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.add, size: 20),
      //           label: AppLocalizations.of(context)!.addTab),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.list, size: 20),
      //           label: AppLocalizations.of(context)!.today),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.school, size: 20),
      //         label: AppLocalizations.of(context)!.courses,
      //       )
      //     ]),
      body: _buildTab(),
    );
  }

  Widget _buildBottom() {
    return Container(
      decoration: BoxDecoration(color: AppColors.hearderBackground),
      height: 70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              children: [
                for (var i = 0; i < 3; i++)
                  Expanded(
                    child: _buildItemNavBar(
                        icon: [Icons.add, Icons.list, Icons.school][i],
                        label: [
                          AppLocalizations.of(context)!.addTab,
                          AppLocalizations.of(context)!.today,
                          AppLocalizations.of(context)!.courses,
                        ][i],
                        index: i),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab() {
    return PageView(
      controller: _pagecontroler,

      onPageChanged: (value) {
        onTabChange(value);
      },
      children: [
        Container(
          child: Addjobs(),
        ),
        Container(
          child: Todayjobs(),
        ),
        Container(
          child: Coursesscreen(),
        ),
      ],
    );
  }

  Widget _buildItemNavBar(
      {required IconData icon, required String label, required int index}) {
    final bool isSelected = (index == currentIndex);
    return GestureDetector(
      onTap: () {
        currentIndex = index;

      },
      child: Column(
        children: [
          Icon(icon, color: isSelected ? AppColors.select : AppColors.label,),
          SizedBox(
            height: 2,
          ),
          Text(label, style: TextStyle(color: isSelected ? AppColors.select : AppColors.label,),)
        ],
      ),
    );
  }
}
