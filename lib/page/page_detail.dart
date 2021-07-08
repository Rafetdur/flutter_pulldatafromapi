import 'package:flutter/material.dart';
import 'package:flutter_apppokedex/controller/controller.dart';
import 'package:flutter_apppokedex/controller/controller_detail.dart';
import 'package:flutter_apppokedex/model/model.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

class PageDetail extends StatefulWidget {
  Etkinlik etkinlik1;
  PageDetail(this.etkinlik1);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends StateMVC<PageDetail> {
  EtkinlikDetailController _con;

  _PageDetailState() : super(EtkinlikDetailController()) {
    _con = controller as EtkinlikDetailController;
  }

  @override
  void initState() {
    _con.getEtkinlikInfoo(widget.etkinlik1.etkinlikId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Etkinlikler"),
          centerTitle: true,
        ),
        body: _con.etkinlik2 == null
            ? Center(child: CircularProgressIndicator())
            :   SingleChildScrollView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(_con.etkinlik2.etkinlikResmi ?? widget.etkinlik1.etkinlikResmi),
              Text('Tip Adı: ' + _con.etkinlik2.etkinlikTipAdi ?? widget.etkinlik1.etkinlikTipAdi),
              Text(_con.etkinlik2.etkinlikId.toString() ?? widget.etkinlik1.toString()),
              Text(_con.etkinlik2.etkinlikPuani.toString() ?? widget.etkinlik1.etkinlikPuani.toString()),
              SizedBox(height: 25),

            ],
          ),
        ));
  }
/*

 */


  Widget _buildEtkinlikCard(Etkinlik etkinlik) {
    return InkWell(
      onTap: () {

      },
      child: Column (
        children: [
          Image.network(etkinlik.etkinlikResmi),
          Text('Etkinlik Puanı: ${etkinlik.etkinlikPuani}'),
          Text('Etkinlik Adi: ${etkinlik.etkinlikTipAdi}'),
          Text('Etkinlik ID: ${etkinlik.etkinlikId}'),

        ],
      ),
    );
  }


}
