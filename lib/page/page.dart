import 'package:flutter/material.dart';
import 'package:flutter_apppokedex/controller/controller.dart';
import 'package:flutter_apppokedex/model/model.dart';
import 'package:flutter_apppokedex/page/page_detail.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends StateMVC<MyHomePage> {
  EtkinlikController _con;

  _MyHomePageState() : super(EtkinlikController()) {
    _con = controller as EtkinlikController;
  }

  @override
  void initState() {
    _con.getEtkinlikInfoo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Etkinlikler"),
          centerTitle: true,
        ),
        body: _con.etkinlikler == null
            ? Center(child: CircularProgressIndicator())
            :   SingleChildScrollView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/1.jpeg")
                    )
                ),),
              SizedBox(height: 25),
              Container(
                height: 500,
                child:  _buildListEtkinlikler(),
              )

            ],
          ),
        ));
  }
/*

 */
  Widget _buildListEtkinlikler() {
    return

    ListView.separated(
    itemCount: _con.etkinlikler.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => _buildEtkinlikCard(
_con.etkinlikler[index]
      ));
  }

  Widget _buildEtkinlikCard(Etkinlik etkinlik) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageDetail(etkinlik.etkinlikId.toString())));
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
