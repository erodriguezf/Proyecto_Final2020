import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;

class Graphic extends StatefulWidget {
  @override
  _GraphicState createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Graficas"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            width: 350,
            height: 300,
            child: graphic.Chart(
              data: [
                {'genre': 'Sports', 'sold': 275},
                {'genre': 'Strategy', 'sold': 115},
                {'genre': 'Action', 'sold': 120},
                {'genre': 'Shooter', 'sold': 350},
                {'genre': 'Other', 'sold': 150},
              ],
              scales: {
                'genre': graphic.CatScale(
                  accessor: (map) => map['genre'] as String,
                ),
                'sold': graphic.LinearScale(
                  accessor: (map) => map['sold'] as num,
                  nice: true,
                )
              },
              geoms: [
                graphic.IntervalGeom(
                  position: graphic.PositionAttr(field: 'genre*sold'),
                )
              ],
              axes: {
                'genre': graphic.Defaults.horizontalAxis,
                'sold': graphic.Defaults.verticalAxis,
              },
            ),
          )),
        ));
  }
}
