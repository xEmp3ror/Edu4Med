import 'package:flutter/material.dart';
import 'package:nevada/models/index.dart';
import 'package:nevada/ui/pages/about.dart';
import 'package:nevada/ui/pages/complementary_exploration.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../widgets/button_cell.dart';
import '../../widgets/index.dart';
import '../../widgets/puntuacion_cell.dart';
import 'arena/index.dart';
import 'index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RowLayout(
            space: 16,
            padding: EdgeInsets.all(8),
            children: <Widget>[
              WelcomeArea(),
              MenuArea(),
              ResultsArea(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                builder: (context) => ModalMenu(),
              ),
            ),
            FutureBuilder<String>(
              future: Provider.of<UserModel>(context).getUserHouse(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Text(
                    'CASA ${snapshot.data.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  );
                else
                  return SizedBox();
              },
            ),
            PopupMenuButton<String>(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                for (final item in ['Información'])
                  PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
              ],
              onSelected: (result) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              ),
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RowLayout(
        space: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hola, ${Provider.of<UserModel>(context).user.name}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Bienvenido a la aplicación de Patología General',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'APRENDE',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w200,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ButtonCell(
                title: 'TEMARIO',
                icon: Icons.folder_open,
                color: Color(0xFFEDA7A7),
                screen: DocumentPage(),
              ),
            ),
            Expanded(
              child: RowLayout(
                space: 0,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ButtonCell(
                    title: 'EXPLORACION FÍSICA',
                    icon: Icons.perm_identity,
                    color: Color(0xFFEDA7E2),
                    screen: PhysicalExploration(),
                  ),
                  ButtonCell(
                    title: 'EXPL. COMPLEMENT.',
                    icon: Icons.person_add,
                    color: Color(0xFFB2C3FF),
                    screen: ComplementaryExploration(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Separator.spacer(space: 16),
        Text(
          'PONTE A PRUEBA',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w200,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ButtonCell(
                title: 'TEST',
                icon: Icons.list,
                color: Color(0xFFBDFF9D),
                screen: TestSelector(),
              ),
            ),
            Expanded(
              child: ButtonCell(
                title: 'ARENA',
                icon: Icons.people,
                color: Color(0xFFFDFF9F),
                screen: ArenaCheckScreen(), //ArenaScreen();
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ResultsArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'RESULTADOS',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w200,
          ),
          textAlign: TextAlign.start,
        ),
        CardPage.body(
          title: 'TEST · ÚLTIMOS RESULTADOS',
          body: FutureBuilder<List<UserTest>>(
            future: Provider.of<UserModel>(context).getUserTests(),
            builder: (context, data) {
              if (data.hasData) {
                if (data.data.isNotEmpty) {
                  return RowLayout(
                    children: [
                      for (final test in data.data)
                        PuntuacionCell(
                          title: test.getChapters,
                          description: test.getDate,
                          mark: test.mark,
                          isMark: true,
                        ),
                    ],
                  );
                } else {
                  return SizedBox(
                    width: double.infinity,
                    child: Text(
                      'No se ha realizado ningun test',
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              } else {
                return Column(
                  children: <Widget>[
                    Center(child: CircularProgressIndicator())
                  ],
                );
              }
            },
          ),
        ),
        Separator.spacer(space: 8),
        CardPage.body(
          title:
              'ARENA · CLASIFICACIÓN GENERAL', //COMPROBAR CUANDO NO HAY ARENAS.
          body: RowLayout(
            children: Provider.of<ArenaModel>(context).isLoading ||
                    Provider.of<ArenaModel>(context).results.length == 0
                ? [Center(child: CircularProgressIndicator())]
                : getHousesMarks(context),
          ),
        ),
      ],
    );
  }

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
}
