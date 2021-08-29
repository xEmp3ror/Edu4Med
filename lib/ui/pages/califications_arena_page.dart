import 'package:flutter/material.dart';
import 'package:nevada/models/index.dart';
import 'package:nevada/widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import 'index.dart';

class CalificationsArenaPage extends StatelessWidget {
  List<Widget> getHousesMarks(BuildContext context) {
    List<num> marks = List(), ordered = List();
    List<String> bestMember = List();
    List<Widget> view = List();

    for (House house in Provider.of<ArenaModel>(context).houses) {
      bestMember.add(Provider.of<ArenaModel>(context).getBestMember(house.id));
      marks.add(Provider.of<ArenaModel>(context).getHouseMark(house.id));
    }

    ordered = List.from(marks)..sort((a, b) => b.compareTo(a));

    for (int i = 0; i < marks.length; ++i) {
      final int index = marks.indexOf(ordered[i]);
      view.add(PuntuacionCell(
        id: '${i + 1}º',
        title: Provider.of<ArenaModel>(context).houses[index].name,
        description: 'Liderado por ${bestMember[index]}',
        mark: marks[index],
      ));
    }

    return view;
  }

  List<Widget> getHousesMarksLast(BuildContext context) {
    List<num> marks = List(), ordered = List();
    List<String> bestMember = List();
    List<Widget> view = List();

    for (House house in Provider.of<ArenaModel>(context).houses) {
      bestMember.add(Provider.of<ArenaModel>(context).getBestMember(house.id));
      marks.add(Provider.of<ArenaModel>(context).getHouseMarkLast(house.id));
    }

    ordered = List.from(marks)..sort((a, b) => b.compareTo(a));

    for (int i = 0; i < marks.length; ++i) {
      final int index = marks.indexOf(ordered[i]);
      view.add(PuntuacionCell(
        id: '${i + 1}º',
        title: Provider.of<ArenaModel>(context).houses[index].name,
        description: 'Liderado por ${bestMember[index]}',
        mark: marks[index],
      ));
    }

    return view;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARENAS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: RowLayout(
          padding: EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Consulta aquí todas tus calificaciones obtenidas en la Arena, mira el desempeño de tu equipo y el tuyo propio. Observa la clasificación general y lucha para hacerte con el primer puesto.",
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            Separator.spacer(space: 4),
            /* HOLA QUE TAL */
            Card(
              child: RowLayout(
                padding:
                    EdgeInsets.only(top: 14, right: 14, left: 14, bottom: 14),
                children: <Widget>[
                  FutureBuilder<String>(
                    future: Provider.of<UserModel>(context).getUserHouse(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Text(
                          'PUNTUACIÓN TOTAL DE ${snapshot.data.toUpperCase()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        );
                      else
                        return SizedBox();
                    },
                  ),
                  Text(
                    '${Provider.of<ArenaModel>(context).getHouseMark(Provider.of<UserModel>(context).user.house)} pts',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 32,
                      color: Color(0xFF009006),
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
                        Provider.of<ArenaModel>(context)
                            .getHouseRight(
                                Provider.of<UserModel>(context).user.house)
                            .toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
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
                      Separator.spacer(space: 24),
                      Text(
                        Provider.of<ArenaModel>(context)
                            .getHouseWrong(
                                Provider.of<UserModel>(context).user.house)
                            .toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
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
            if (Provider.of<ArenaModel>(context).arenaEmpty)
              CardPage.body(
                title: 'ARENA · ÚLTIMOS RESULTADOS',
                body: RowLayout(
                  children: Provider.of<ArenaModel>(context).isLoading
                      ? [Center(child: CircularProgressIndicator())]
                      : getHousesMarksLast(context),
                ),
              ),
            CardPage.body(
              title: 'ARENA · CLASIFICACIÓN GENERAL',
              body: RowLayout(
                children: Provider.of<ArenaModel>(context).isLoading
                    ? [Center(child: CircularProgressIndicator())]
                    : getHousesMarks(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
