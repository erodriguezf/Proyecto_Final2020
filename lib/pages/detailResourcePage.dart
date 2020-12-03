import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/constantsResource.dart';
import 'package:proyecto_final_2020_2/classes/dataResource.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class DetailPage extends StatelessWidget {
  final GuiaInfo guiaInfo;

  const DetailPage({Key key, this.guiaInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          guiaInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                          maxLines: 20,
                          textAlign: TextAlign.left,
                        ),
                        PDF.assets(
                          "assets/${guiaInfo.pdf}",
                          height: 600,
                          width: 600,
                        ),
                        // SizedBox(height: 300),
                        // Text(
                        //   guiaInfo.name,
                        //   style: TextStyle(
                        //     fontFamily: 'Avenir',
                        //     fontSize: 26,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.w900,
                        //   ),
                        //   maxLines: 20,
                        //   textAlign: TextAlign.left,
                        // ),
                        // Divider(color: Colors.black38),
                        // SizedBox(height: 32),
                        // Text(
                        //   guiaInfo.description ?? '',
                        //   maxLines: 200,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: TextStyle(
                        //     fontFamily: 'Avenir',
                        //     fontSize: 20,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        // SizedBox(height: 32),
                        // Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  // guiaInfo.images.length > 0
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(left: 32.0),
                  //         child: Text(
                  //           'Fotos Recreativas',
                  //           style: TextStyle(
                  //             fontFamily: 'Avenir',
                  //             fontSize: 25,
                  //             color: const Color(0xff47455f),
                  //             fontWeight: FontWeight.w300,
                  //           ),
                  //           textAlign: TextAlign.left,
                  //         ),
                  //       )
                  //     : Text(""),
                  // guiaInfo.images.length > 0
                  //     ? Container(
                  //         height: 250,
                  //         padding: const EdgeInsets.only(left: 32.0),
                  //         child: ListView.builder(
                  //             itemCount: guiaInfo.images.length,
                  //             scrollDirection: Axis.horizontal,
                  //             itemBuilder: (context, index) {
                  //               return Card(
                  //                 clipBehavior: Clip.antiAlias,
                  //                 shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(24),
                  //                 ),
                  //                 child: AspectRatio(
                  //                     aspectRatio: 1,
                  //                     child: Image.network(
                  //                       guiaInfo.images[index],
                  //                       fit: BoxFit.cover,
                  //                     )),
                  //               );
                  //             }),
                  //       )
                  //     : Text(""),
                ],
              ),
            ),
            // Positioned(
            //   right: -64,
            //   child: Hero(
            //       tag: guiaInfo.position,
            //       child: Image.asset(guiaInfo.iconImage)),
            // ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                guiaInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
