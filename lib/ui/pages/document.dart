import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../../models/index.dart';

class DocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Temario'),
          centerTitle: true,
        ),
        body: model.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  Separator.spacer(space: 12),
                  Text(
                    "ADVERTENCIA",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Los archivos aquí contenidos corresponden al curso académico 2018/19 y podrían diferir en menor o mayor medida de los establecidos en el presente curso académico. Contraste cada apartado con las lecciones y presentaciones proporcionadas por el profesor responsable.",
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.items.length,
                    itemBuilder: (context, index) {
                      final Document document = model.getItem(index);
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(document.number.toString()),
                              radius: 18,
                            ),
                            title: Text(
                              document.title,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () {
                              DefaultCacheManager()
                                  .getFile(document.getUrl)
                                  .listen((f) => OpenFile.open(f.file.path));
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Abriendo archivo...'),
                              ));
                            },
                          ),
                          Separator.divider(indent: 72)
                        ],
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

/*


// COMO PONER LA ADVERTENCIA. //


class DocumentMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temario'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RowLayout(
            space: 16,
            padding: EdgeInsets.all(8),
            children: <Widget>[
              DocumentPage(),
              DocumentsWarning(),
            ],
          ),
        ],
      ),
    );
  }
}

class DocumentsWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Los documentos que se encuentran ",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class DocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentModel>(
      builder: (context, model, child) => Scaffold( //NO SÉ QUITAR EL SCAFFOLD QUE DA ERROR PORQUE CLARO, HAY DOS, UNO ARRIBA Y OTRO AQUÍ, AJIA.
        body: model.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: model.items.length,
                itemBuilder: (context, index) {
                  final Document document = model.getItem(index);
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(document.number.toString()),
                          radius: 18,
                        ),
                        title: Text(
                          document.title,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          DefaultCacheManager()
                              .getFile(document.getUrl)
                              .listen((f) => OpenFile.open(f.file.path));
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Abriendo archivo...'),
                          ));
                        },
                      ),
                      Separator.divider(indent: 72)
                    ],
                  );
                },
              ),
      ),
    );
  }
}
*/
