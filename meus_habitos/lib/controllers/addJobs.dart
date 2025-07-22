import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meus_habitos/constants.dart';
import 'package:meus_habitos/l10n/app_localizations.dart';

class Addjobs extends StatefulWidget {
  Addjobs({Key? key}) : super(key: key);
  
  AddjobsState createState() => AddjobsState();
}

class AddjobsState extends State<Addjobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hearderBackground,
      appBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.addTab, style: TextStyle(color: AppColors.label),),
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