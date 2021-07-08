


import 'package:flutter_apppokedex/model/model.dart';

import 'api_manager.dart';

//  https://scpappapi.site/api/SCPTest/TestApi?tipID=1


Future<Etkinlik> getEtkinlikInfo(String tipID) async {

  var endpoint = '/TestApi';
  var response = await ApiManager()
      .getRequest(endpoint);
  return Etkinlik.fromJSON(response);
}
