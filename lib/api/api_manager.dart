import 'dart:async';
import 'dart:convert';
import "dart:core";
import 'package:flutter_apppokedex/model/model.dart';

import 'dio_client.dart';
import 'package:http/http.dart' as http;
//

//  https://ogelir.com/api/v1/categories/TestApiroot

class ApiManager {
  final String BASE_URL= "https://scpappapi.site/api/SCPTest";
  final String AUTHORITY = "scpappapi.site";
  final String BASE_ENDPOINT = "/api/SCPTest/";

Future <List<Etkinlik>> getEtkinlikler (String kullaniciID) async {
  final result = await  dio.get("/TestApi", queryParameters: {
    'kulaniciID': kullaniciID
  });
  print(result.data);
  if (result.data is List) {
    List etkinlikler = result.data;
    return etkinlikler.map((e) => Etkinlik.fromJSON(e)).toList();
  }
  return [];
}

Future <Etkinlik> getEtkinlikbyTipID (String tipID) async{
  final result = await dio.get("/TipAdi", queryParameters: {
    'tipID' :tipID
  });
  if (result.data != null) {
    return Etkinlik.fromJSON(result.data);
  }
  return null;
}

  Future<dynamic> getRequest(String endPoint,
      ) async {
    try {
      var uri = Uri.https(AUTHORITY, BASE_ENDPOINT + endPoint,);
      print('getRequest: ${uri.toString()}');
      /* var headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }*/
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('http error ${response.statusCode}, ${response.body}');
      }
    } catch (e, trace) {
      print(trace);
    }
    return null;
  }




}
