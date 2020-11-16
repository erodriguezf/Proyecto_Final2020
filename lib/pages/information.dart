import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  List<Item> info = new List<Item>();

  @override
  void initState() {
    Item f1 = new Item(
        expandedValue: "Etapa temprana",
        headerValue: "FASE 1",
        texto:
            "En la etapa temprana del Alzheimer, la persona puede desenvolverse de forma independiente. Es posible que pueda conducir, trabajar y participar de actividades sociales. A pesar de esto, la persona puede sentir que tiene episodios de pérdida de memoria, que incluyen olvidarse palabras familiares o la ubicación de objetos cotidianos.");

    Item f2 = new Item(
        expandedValue: "Etapa media",
        headerValue: "FASE 2",
        texto:
            "El Alzheimer moderado generalmente constituye la etapa más prolongada y puede durar muchos años. A medida que la enfermedad avanza, la persona con Alzheimer requerirá un mayor nivel de atención. Es posible que note que la persona con Alzheimer confunde palabras, se frustra o enoja, o actúa de forma inesperada (por ejemplo, no quiere bañarse). El daño a las células nerviosas del cerebro puede dificultar la expresión de pensamientos y la realización de tareas cotidianas.");

    Item f3 = new Item(
        expandedValue: "Etapa final",
        headerValue: "FASE 3",
        texto:
            "En la etapa final de esta enfermedad, las personas pierden la capacidad de responder a su entorno, de llevar adelante una conversación y, eventualmente, de controlar los movimientos. Todavía pueden decir palabras o frases, pero la comunicación se torna difícil. A medida que la memoria y las habilidades cognitivas empeoran, es posible que ocurran cambios significativos en la personalidad y que las personas necesiten mucha ayuda con las tareas diarias.");

    info.addAll([f1, f2, f3]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "INFO GENERAL",
              ),
              Tab(
                text: "FASE A FASE",
              ),
            ],
          ),
          title: Text('INFORMATIVO'),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "¿Qué es el Alzheimer?",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 15,
                        ),
                        child: Text(
                          "La  enfermedad  de  Alzheimer  es  un  trastorno  neurológico  que  provoca  la  muerte  de  las  células  nerviosas  del  cerebro.  Por  lo  general,  la  Enfermedad  de  Alzheimer  comienza  paulatinamente  y  sus  primeros síntomas pueden atribuirse a la vejez o al olvido común. A medida en que avanza la enfer-medad, se van deteriorando las capacidades cognitivas, entre ellas la capacidad para tomar decisio-nes y llevar a cabo las tareas cotidianas, y pueden surgir modificaciones de la personalidad, así como  conductas  problemáticas.",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Resumen del avance de la enfermedad",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            right: 25,
                            bottom: 15,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Los síntomas de la enfermedad de Alzheimer empeoran con el tiempo, aunque la velocidad a la que avanza la enfermedad varía. En promedio, una persona con Alzheimer vive de cuatro a ocho años después del diagnóstico, pero puede vivir hasta 20 años, dependiendo de otros factores.",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 15,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              Text(""),
                              Text(
                                "Los cambios en el cerebro relacionados con el Alzheimer comienzan años antes de que aparezcan los signos de la enfermedad. Este período de tiempo, que puede durar años, se conoce como Alzheimer preclínico.",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 15,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              Text(""),
                              Text(
                                "Las etapas que siguen brindan una idea general de cómo cambian las habilidades una vez que aparecen los síntomas y solo debe usarse como guía general. Se separan en tres categorías diferentes: enfermedad de Alzheimer leve, enfermedad de Alzheimer moderada y enfermedad de Alzheimer grave. Tenga en cuenta que puede ser difícil ubicar a una persona con Alzheimer en una etapa específica, ya que las etapas se superponen.",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 15,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ],
                          )),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Alzheimer de inicio temprano/precoz",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 15,
                        ),
                        child: Text(
                          "El Alzheimer no es solo una enfermedad de la vejez. El Alzheimer de inicio temprano (también conocido como de inicio precoz) afecta a personas de menos de 65 años. Alrededor de un 5 por ciento de los más de 5 millones de estadounidenses con Alzheimer tienen inicio temprano.",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "¿Quién padece Alzheimer de inicio temprano?",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 15,
                        ),
                        child: Text(
                          "Muchas personas con Alzheimer de inicio temprano tienen entre 40 y 50 años. Tienen familias, carreras profesionales o son incluso cuidadores cuando el Alzheimer hace su aparición. En Estados Unidos, se estima que aproximadamente 200.000 personas tienen Alzheimer de inicio temprano.",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Cómo diagnosticar el Alzheimer de inicio temprano",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 15,
                        ),
                        child: Text(
                          "Dado que los proveedores de atención médica generalmente no esperan encontrar Alzheimer en personas más jóvenes, obtener un diagnóstico preciso del Alzheimer en etapa temprana puede ser un proceso largo y frustrante. Los síntomas suelen atribuirse incorrectamente al estrés y es posible que diferentes médicos lleguen a diagnósticos opuestos. Las personas con Alzheimer de inicio temprano pueden encontrarse en cualquier etapa de la demencia: temprana, media o final. La enfermedad afecta a todas las personas de forma diferente y los síntomas varían.",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Causas del inicio temprano, incluida la genética",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: 15,
                        ),
                        child: Text(
                          "Los médicos no comprenden por qué la mayoría de los casos de Alzheimer de inicio temprano aparecen a una edad tan temprana. Pero en unos centenares de familias en todo el mundo, los científicos detectaron varios genes infrecuentes que causan directamente el Alzheimer. Las personas que heredan estos genes infrecuentes tienden a desarrollar los síntomas entre los 30, 40 y 50 años. Cuando la enfermedad de Alzheimer es causada por genes deterministas, se llama “enfermedad de Alzheimer hereditaria”, y muchos familiares en múltiples generaciones se ven afectados.",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 15,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
                child: Container(
              child: _buildPanel(),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          info[index].isExpanded = !isExpanded;
        });
      },
      children: info.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              tileColor: Colors.blue[50],
              title: Text(
                item.headerValue,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold),
              ),
            );
          },
          body: ListTile(
            title: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                item.expandedValue,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 15,
              ),
              child: Text(
                item.texto,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;
  String texto;
  Item(
      {this.expandedValue,
      this.headerValue,
      this.isExpanded = false,
      this.texto});
}
