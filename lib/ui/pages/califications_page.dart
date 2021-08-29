import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../models/index.dart';
import '../../widgets/index.dart';
import 'califications_arena_page.dart';

class CalificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALIFICACIONES'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<UserTest>>(
          future: Provider.of<UserModel>(context).getUserTestsFull(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              double media = 0;
              int right = 0, wrong = 0;

              data.forEach((element) {
                media += element.mark;
                wrong += element.wrong;
                right += element.right;
              });

              media /= data.length;

              return RowLayout(
                padding: EdgeInsets.all(16),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Consulta aquí todas tus calificaciones obtenidas en la aplicación. Podrás ver las notas que has obtenido y tus resultados globales.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  Separator.spacer(space: 4),
                  ListTile(
                    title: Text("Calificaciones de las Arenas"),
                    subtitle: Text(
                        "Aquí podrás ver las calificaciones de las Arenas, así como el desempeño de tu equipo, el del resto de casas y el tuyo propio"),
                    onTap: Provider.of<ArenaModel>(context).results.length != 0
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CalificationsArenaPage()),
                            )
                        : null,
                  ),
                  Separator.spacer(space: 4),
                  /* HOLA QUE TAL */
                  Card(
                    child: RowLayout(
                      padding: EdgeInsets.only(
                          top: 14, right: 14, left: 14, bottom: 14),
                      children: <Widget>[
                        Text(
                          "NOTA MEDIA DEL EXPEDIENTE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          media.toString() == 'NaN'
                              ? "-"
                              : media.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 32,
                            color: 7.89 >= 5
                                ? Color(0xFF009006)
                                : Color(0xFF900000),
                          ),
                        ),
                        Divider(
                          height: 14,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              right.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 34,
                                color: Color(0xFF009006),
                              ),
                            ),
                            Separator.spacer(space: 16),
                            Text(
                              "ACIERTOS \nTOTALES",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Separator.spacer(space: 48),
                            Text(
                              wrong.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 34,
                                color: Color(0xFF900000),
                              ),
                            ),
                            Separator.spacer(space: 16),
                            Text(
                              "FALLOS \nTOTALES",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CardPage.body(
                    title: 'TODOS LOS RESULTADOS',
                    body: RowLayout(
                      children: [
                        if (data.isNotEmpty)
                          RowLayout(
                            children: [
                              for (final test in data)
                                PuntuacionCell(
                                  title: test.getChapters,
                                  description: test.getDate,
                                  mark: test.mark,
                                  isMark: true,
                                ),
                            ],
                          )
                        else
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'No se ha realizado ningun test',
                              textAlign: TextAlign.center,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
