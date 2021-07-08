
import 'package:flutter/material.dart';



class Etkinlik {

  int etkinlikId;
  int etkinlikPuani;
  String etkinlikResmi;
  String etkinlikTipAdi;
  int etkinlikTip;


  Etkinlik();

  Etkinlik.fromJSON(Map<String, dynamic> jsonMap) {

    etkinlikId = jsonMap['EtkinlikID'];
    etkinlikPuani = jsonMap['EtkinlikPuani'];
    etkinlikResmi = jsonMap['EtkinlikResmi'];
    etkinlikTipAdi = jsonMap['EtkinlikTipAdi'];
    etkinlikTip = jsonMap['EtkinlikTİp'];

  }
}








