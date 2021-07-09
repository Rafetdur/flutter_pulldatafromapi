import 'package:flutter/material.dart';
import 'package:flutter_apppokedex/api/api.dart';
import 'package:flutter_apppokedex/api/api_manager.dart';
import 'package:flutter_apppokedex/model/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';



class EtkinlikController extends ControllerMVC {
  ApiManager apiManager = ApiManager();

  List<Etkinlik> etkinlikler;
  Map<String, Etkinlik> etkinlikler2 = {};



  void getEtkinlikInfoo() async{
    final result = await apiManager.getEtkinlikler('1');
    setState(() {
      etkinlikler = result;
    });
  }

  void getEtkinlik(String TipID) async{
    final result = await apiManager.getEtkinlikbyTipID(TipID);

    setState(() {
      etkinlikler2[TipID] = result;
    });
  }

}
