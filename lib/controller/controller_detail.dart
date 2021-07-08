import 'package:flutter/material.dart';
import 'package:flutter_apppokedex/api/api.dart';
import 'package:flutter_apppokedex/api/api_manager.dart';
import 'package:flutter_apppokedex/model/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';



class EtkinlikDetailController extends ControllerMVC {
  ApiManager apiManager = ApiManager();

  Etkinlik etkinlik;



  void getEtkinlikInfoo(String TipID) async{
    final result = await apiManager.getEtkinlikbyTipID(TipID);
    setState(() {
      etkinlik = result;
    });
  }

}
