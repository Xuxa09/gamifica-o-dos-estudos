import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_habitos/constants.dart';
import 'package:meus_habitos/l10n/app_localizations.dart';

class Coursesscreen extends StatefulWidget {
  Coursesscreen({Key? key}) : super(key: key);
  
  CoursesscreenState createState() => CoursesscreenState();
}

class CoursesscreenState extends State<Coursesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hearderBackground,
      appBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.courses, style: TextStyle(color: AppColors.label),),
        backgroundColor: AppColors.hearderBackground,
      ),
      body: Column(
        children: [
          // hearder
          Expanded(
              child: Container(
            color: AppColors.background,
          ))
        ],
      ),
    );
  }
}
