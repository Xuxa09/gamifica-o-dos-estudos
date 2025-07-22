import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_habitos/constants.dart';
import 'package:meus_habitos/l10n/app_localizations.dart';

class Todayjobs extends StatefulWidget {
  Todayjobs({Key? key}) : super(key: key);
  TodayjobsState createState() => TodayjobsState();
}

class TodayjobsState extends State<Todayjobs> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.hearderBackground,
      appBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.today, style: TextStyle(color: AppColors.label),),
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
