import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_2020_2/pages/resource_page.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.white,
            ),
            onPressed: () => {}),
        title: Text("Plan Semanal de Sesiones"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.ellipsisV),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 60.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xff5a348b),
                      gradient: LinearGradient(
                          colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0)), //Gradient
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                child: Text(
                                  'Lunes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            //Two Column Table

                            //SingleChildScrollView(
                            Scrollbar(
                              //InteractiveViewer(
                              //scrollDirection: Axis.vertical,
                              child: DataTable(
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Text('Actividad'),
                                  ),
                                  DataColumn(
                                    label: Text('Jornada'),
                                  ),
                                ],
                                rows: <DataRow>[
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        "Estimulación Cognitiva (60 min)",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        'Mañana',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        '''Orientación a la realidad ''',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        'Mañana',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        "Gerontogimnasia (30 min)",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        'Mañana',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        "PSICOMOTRICIDAD (45min)",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        'Mañana',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(" AVD (40 min)",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                    DataCell(
                                      Text(
                                        'Tarde',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            //Button
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: RaisedButton(
                                  color: new Color(0xffffffff),
                                  child: Text(
                                    'Ver',
                                    style: TextStyle(
                                      color: new Color(0xff6200ee),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResourcePage()));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //Martes
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xff5a348b),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFE6197), Color(0xFFFFB463)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0)), //Gradient
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                child: Text(
                                  'Martes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            //Two Column Table
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text('Actividad'),
                                ),
                                DataColumn(
                                  label: Text('Jornada'),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Estimulación Cognitiva (60 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      '''Orientación a la realidad ''',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Gerontogimnasia (30 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text("Laborterapia (60 min)",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataCell(
                                    Text(
                                      'Tarde',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),

                            //Button
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: RaisedButton(
                                  color: new Color(0xffffffff),
                                  child: Text(
                                    'Ver',
                                    style: TextStyle(
                                      color: new Color(0xff6200ee),
                                    ),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Miercoles
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xff5a348b),
                      gradient: LinearGradient(
                          colors: [Color(0xFF61A3FE), Color(0xFF63FFD5)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0)), //Gradient
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                child: Text(
                                  'Miercoles',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            //Two Column Table
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text('Actividad'),
                                ),
                                DataColumn(
                                  label: Text('Jornada'),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Estimulación Cognitiva (60 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      '''Orientación a la realidad ''',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Gerontogimnasia (30 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "PSICOMOTRICIDAD (45min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(" AVD (40 min)",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataCell(
                                    Text(
                                      'Tarde',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),

                            //Button
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: RaisedButton(
                                  color: new Color(0xffffffff),
                                  child: Text(
                                    'Ver',
                                    style: TextStyle(
                                      color: new Color(0xff6200ee),
                                    ),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Jueves
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xff5a348b),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFFA738), Color(0xFFFFE130)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0)), //Gradient
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                child: Text(
                                  'Jueves',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            //Two Column Table
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text('Actividad'),
                                ),
                                DataColumn(
                                  label: Text('Jornada'),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Estimulación Cognitiva (60 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      '''Orientación a la realidad ''',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Gerontogimnasia (30 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(" Laborterapia (60 min)",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataCell(
                                    Text(
                                      'Tarde',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),

                            //Button
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: RaisedButton(
                                  color: new Color(0xffffffff),
                                  child: Text(
                                    'Ver',
                                    style: TextStyle(
                                      color: new Color(0xff6200ee),
                                    ),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Viernes
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xff5a348b),
                      gradient: LinearGradient(
                          colors: [Color(0xFFFF5DCD), Color(0xFFFF8484)],
                          begin: Alignment.centerRight,
                          end: Alignment(-1.0, -1.0)), //Gradient
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                child: Text(
                                  'Viernes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            //Two Column Table
                            DataTable(
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Text('Actividad'),
                                ),
                                DataColumn(
                                  label: Text('Jornada'),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Estimulación Cognitiva (60 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      '''Orientación a la realidad ''',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "Gerontogimnasia (30 min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      "PSICOMOTRICIDAD (45min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      'Mañana',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                                DataRow(cells: <DataCell>[
                                  DataCell(
                                    Text(" ",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  DataCell(
                                    Text(
                                      'Tarde',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),

                            //Button
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: RaisedButton(
                                  color: new Color(0xffffffff),
                                  child: Text(
                                    'Ver',
                                    style: TextStyle(
                                      color: new Color(0xff6200ee),
                                    ),
                                  ),
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal, color: new Color(0xffffffff)),
    title: Text(
      rowVal,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
