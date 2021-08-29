import 'package:flutter/material.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class AuscultacionPatologica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonidos patológicos"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Text(
            "Los sonidos patológicos se reproducirán solamente en el foco en el que, idealmente, más se debería escuchar al auscultar a un paciente. Por motivos didácticos, los demás focos reproducirán sonidos normales aunque esto podría no ajustarse a la realidad de un caso clínico, pues si hubiera una patología puede ser varios los focos que muestren algún ruido sobreañadido.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
          Separator.spacer(space: 16),
          Text(
            "FOCO AÓRTICO",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text("Estenosis aórtica"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Estenosis aórtica',
                  audios: [
                    '1_estenosis_aortica',
                    'normal',
                    'normal',
                    'normal',
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Insuficiencia aórtica"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Insuficiencia aórtica',
                  audios: [
                    '2_insuficiencia_aortica',
                    'normal',
                    'normal',
                    'normal',
                  ],
                ),
              ),
            ),
          ),
          Separator.spacer(space: 6),
          Text(
            "FOCO PULMONAR",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text("Estenosis pulmonar"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Estenosis pulmonar',
                  audios: [
                    'normal',
                    '5_estenosis_pulmonar',
                    'normal',
                    'normal',
                  ],
                ),
              ),
            ),
          ),
          Separator.spacer(space: 12),
          Text(
            "FOCO TRICUSPÍDEO",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text("Insuficiencia tricuspide"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Insuficiencia tricuspide',
                  audios: [
                    'normal',
                    'normal',
                    '4_insuficiencia_tricuspidea',
                    'normal',
                  ],
                ),
              ),
            ),
          ),
          Separator.spacer(space: 12),
          Text(
            "FOCO MITRAL",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text("Estenosis mitral"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Estenosis mitral',
                  audios: [
                    'normal',
                    'normal',
                    'normal',
                    '1_estenosis_mitral',
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Insuficiencia mitral"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Insuficiencia mitral',
                  audios: [
                    'normal',
                    'normal',
                    'normal',
                    '2_insuficiencia_mitral_soplo_pansistolico',
                  ],
                ),
              ),
            ),
          ),
          Separator.spacer(space: 12),
          Text(
            "CUALQUIER FOCO",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text("Tercer ruido"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Tercer ruido',
                  audios: [
                    '3_tercer_ruido',
                    '3_tercer_ruido',
                    '3_tercer_ruido',
                    '3_tercer_ruido',
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Cuarto ruido"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: 'Cuatro ruido',
                  audios: [
                    '3_cuarto_ruido',
                    '3_cuarto_ruido',
                    '3_cuarto_ruido',
                    '3_cuarto_ruido',
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("3er y 4o ruido"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyPage(
                  title: '3er y 4o ruido',
                  audios: [
                    '2_tercer_y_cuarto_ruidos',
                    '2_tercer_y_cuarto_ruidos',
                    '2_tercer_y_cuarto_ruidos',
                    '2_tercer_y_cuarto_ruidos',
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
