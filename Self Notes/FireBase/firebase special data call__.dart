

// firebase doc dan butun verileri toplama alan adi ile cagirma


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class WeightChart extends StatefulWidget {
  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart>  {
  dynamic data;

  Future<dynamic> getData() async {

    final DocumentReference document =   Firestore.instance.collection("listofprods").document('ac1');

    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
     setState(() {
       data =snapshot.data;
     });
    });
 }

 @override
  void initState() {

    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child: ListTile(
                    title: Text(data['name']),//here error
              ),
            )
          ]
        )
      ),
    );
  }
}
