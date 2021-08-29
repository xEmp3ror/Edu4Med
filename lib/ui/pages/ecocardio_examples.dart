import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class EcocardioExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplos animados'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RowLayout.cards(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Los ejemplos se dividen en los siguientes apartados:",
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              Separator.spacer(space: 4),
              ListTile(
                title: Text("Ecocardio normal"),
                subtitle: Text("4 ejemplos"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples4(
                      exampleTitle: 'Ecocardio normal',
                      title1: '3 DIMENSIONES',
                      image1:
                          'assets/images/ecg_examples/Ecocardio_Normal/normal_3D.gif',
                      title2: '4 CAMARAS',
                      image2:
                          'assets/images/ecg_examples/Ecocardio_Normal/normal_4camaras.gif',
                      title3: 'EJE CORTO',
                      image3:
                          'assets/images/ecg_examples/Ecocardio_Normal/normal_ejecorto.gif',
                      title4: 'EJE LARGO',
                      image4:
                          'assets/images/ecg_examples/Ecocardio_Normal/normal_ejelargo.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Derrame pericárdico"),
                subtitle: Text("1 ejemplo"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples1(
                      exampleTitle: 'Derrame pericárdico',
                      title1: 'EJE LARGO',
                      image1:
                          'assets/images/ecg_examples/Derrame_Pericardico/dpericardico_ejelargo.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Disfunción severa VI"),
                subtitle: Text("2 ejemplos"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples2(
                      exampleTitle: 'Disf. Severa VI',
                      title1: 'APICAL 4 CÁMARAS',
                      image1:
                          'assets/images/ecg_examples/Disfuncion_Severa_VI/dseveraVI_4camaras.gif',
                      title2: '3 DIMENSIONES',
                      image2:
                          'assets/images/ecg_examples/Disfuncion_Severa_VI/dseveraVI_3D.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("CIA"),
                subtitle: Text("2 ejemplos"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples2(
                      exampleTitle: 'CIA',
                      title1: '4 CÁMARAS',
                      image1: 'assets/images/ecg_examples/CIA/cia_4camaras.gif',
                      title2: '4 CAMARAS A COLOR',
                      image2:
                          'assets/images/ecg_examples/CIA/cia_4camarascolor.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Endocarditis"),
                subtitle: Text("2 ejemplos"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples2(
                      exampleTitle: 'Endocarditis',
                      title1: 'ETE',
                      image1:
                          'assets/images/ecg_examples/Endocarditis/endocarditis_ETE.gif',
                      title2: 'ETE A COLOR',
                      image2:
                          'assets/images/ecg_examples/Endocarditis/endocarditis_ETEColor.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Insuficiencia aórtica"),
                subtitle: Text("1 ejemplo"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples1(
                      exampleTitle: 'Insuficiencia aórtica',
                      title1: '3 CÁMARAS',
                      image1:
                          'assets/images/ecg_examples/Insuficiencia_Aortica/inaortica_3camaras.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Mixoma auricular"),
                subtitle: Text("1 ejemplo"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples1(
                      exampleTitle: 'Mixoma auricular',
                      title1: 'ETE',
                      image1:
                          'assets/images/ecg_examples/Mixoma_Auricular/mixoma_ETE.gif',
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Prolapso mitral"),
                subtitle: Text("2 ejemplos"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcocardioExamples2(
                      exampleTitle: 'Prolapso mitral',
                      title1: '4 CÁMARAS',
                      image1:
                          'assets/images/ecg_examples/Prolapso_Mitral/prolapso_4camaras.gif',
                      title2: '4 CAMARAS A COLOR',
                      image2:
                          'assets/images/ecg_examples/Prolapso_Mitral/prolapso_4camarascolor.gif',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
