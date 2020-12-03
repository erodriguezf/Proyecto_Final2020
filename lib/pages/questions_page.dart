import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DUDAS GENERALES'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "¿Cuáles son los síntomas de la enfermedad de Alzheimer?",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
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
                    '''
La enfermedad de Alzheimer presenta síntomas que tienen una afección directa sobre las actividades de la vida cotidiana. Los síntomas del Alzheimer son cognitivos y conductuales. Algunos de estos síntomas del Alzheimer son: 

    • Olvidos o dificultad para recordar información reciente, como qué ha comido o qué ha hecho durante el día. Olvidos de fechas o hechos relevantes, del día de la semana o del año en curso.

    • Repetición en bucle del mismo tema o pregunta: dónde vamos mañana o quién vendrá de visita.

    • Dificultad para seguir instrucciones, realizar la contabilidad doméstica, tomar la medicación correctamente, cocinar, ir a comprar o vestirse.

    • Necesidad de contar con la ayuda de los demás para hacer cosas que antes la persona hacía sola o necesidad de más tiempo para hacerlas.

    • Dificultad para orientarse en lugares conocidos, como no saber volver a casa cuando ha salido a comprar o confundir los lugares donde acaba de estar o en los que se encuentra en este momento.

    • Confusión con la identidad de las personas y dificultad para apreciar el paso del tiempo, como confundir a conocidos actuales con otros del pasado.

    • Dificultades para seguir una conversación, mostrar un lenguaje empobrecido, a menudo con dificultades para nombrar objetos cotidianos, o abandonar una conversación a medias sin ser consciente de ello.

    • Pérdida de objetos personales importantes o dinero.

    • Alteraciones del juicio que propician que caiga fácilmente en engaños por parte de otras personas.

    • Alteraciones del cuidado y la higiene personal y del hogar.

    • Falta de interés o dificultad para realizar actividades a las que era aficionada.

    • Pérdida de interés por la interacción social con otras personas. Dificultad para interpretar bromas o el estado de ánimo de los otros.

    • Cambios de personalidad: a menudo la persona se vuelve más desconfiada e incluso agresiva, o puede estar deprimida y llorar sin motivo aparente.
    
    • Nerviosismo en ambientes o situaciones nuevas que la persona tiene dificultades para controlar.

                    ''',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 200,
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
                    "¿Existe una cura? ¿Cuál es el tratamiento de la enfermedad de Alzheimer?",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 200,
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
                          '''No existe ningún tratamiento que frene o modifique la evolución de la enfermedad. Hay medicamentos que ayudan a paliar de forma temporal la sintomatología.''',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,
                          style: TextStyle(fontSize: 17, color: Colors.black),
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
                    "Si no existe una cura, ¿por qué es tan importante el diagnóstico?",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 200,
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
                    "Disponer de un diagnóstico de Alzheimer permite al propio enfermo hacer planes de futuro y tomar sus propias decisiones antes de que no pueda hacerlo. El diagnóstico es clave en el manejo y salud de la persona enferma. Una pérdida de memoria no es necesariamente un diagnóstico de la enfermedad. Una visita al neurólogo permitirá excluir la posibilidad de que los síntomas tengan una causa distinta y potencialmente tratable. Llegado el caso de que se diagnostique la enfermedad, la persona enferma y sus cuidadores podrán contar con los cuidados y tratamientos más adecuados a la hora de mejorar transitoriamente los síntomas.",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 200,
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
                    "¿Qué causa la enfermedad de Alzheimer?",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
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
                    "Al contrario de lo que ocurre con otras enfermedades, hoy en día todavía desconocemos cuáles son las causas que originan la enfermedad de Alzheimer. Cada vez son más las evidencias que apoyan la idea de que no hay una única causa, sino que son varios los factores que, en mayor o menor medida, pueden incidir en su posible desarrollo. Es lo que conocemos como factores de riesgo del Alzheimer. Unos son modificables y otros no. Se calcula que se podría prevenir el Alzheimer en uno de cada 3 casos incidiendo en los factores de riesgo que sí podemos modificar.",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 200,
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
                    "¿A quién afecta más esta enfermedad: a los varones o a las mujeres?",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 200,
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
                    "No existe una inclinación a padecerla más un sexo que el otro. Si en las estadísticas aparece un mayor número de enfermas, se debe principalmente a que la esperanza de vida de las mujeres es mayor que la de los hombres.",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
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
                    "¿Difiere la enfermedad de Alzheimer de una persona a otra?",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
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
                    "Sí, la enfermedad afecta a cada persona de forma distinta. Ni la duración ni la velocidad del declive son iguales para todos los enfermos. Existe un mismo patrón que se repite, con una evolución típica de la enfermedad que se divide en sucesivas fases del Alzheimer en función de los síntomas habituales. Sin embargo, el impacto y la sintomatología dependen de cada persona enferma, y, por ello, cobran especial relevancia la personalidad, las condiciones físicas y la situación social de cada enfermo. De ahí que cada familia deba encontrar su propia manera de vivir con la enfermedad. Además, en algunas personas, el Alzheimer se suma a otros problemas de salud pre-existentes que pueden hacer más difícil su cuidado. Ante esta situación, debe consultar a su médico para que le aconseje la mejor manera de controlar ambas enfermedades.",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                    style: TextStyle(fontSize: 17, color: Colors.black),
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
