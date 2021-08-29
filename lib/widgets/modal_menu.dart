import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:provider/provider.dart';
import 'package:row_collection/row_collection.dart';

import '../models/index.dart';
import '../ui/pages/califications_page.dart';
import '../utils/url.dart';

class ModalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: RowLayout(
            space: 16,
            children: <Widget>[
              Text(
                'PATOLOGÍA GENERAL',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
              InkWell(
                // onTap: () async => await FlutterWebBrowser.openWebPage(
                //   url: Url.congressUrl,
                //   androidToolbarColor: Theme.of(context).primaryColor,
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 42,
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                        SizedBox(width: 16),
                        RowLayout(
                          space: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Provider.of<UserModel>(context).user.name,
                              style: TextStyle(fontSize: 18),
                            ),
                            FutureBuilder<String>(
                              future: Provider.of<UserModel>(context)
                                  .getUserHouse(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData)
                                  return Text(
                                    'Casa ${snapshot.data}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subhead
                                        .copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .color,
                                        ),
                                  );
                                else
                                  return SizedBox();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.school, size: 32),
          title: Text('Acceder al Moodle de la UCO'),
          onTap: () async => await FlutterWebBrowser.openWebPage(
            url: 'https://moodle.uco.es/m1920',
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          leading: Icon(Icons.assessment, size: 32),
          title: Text('Consulta de calificaciones'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalificationsPage()),
          ),
        ),
        ListTile(
          leading: Icon(Icons.error, size: 32),
          title: Text('Reporta un error'),
          onTap: () async => await FlutterMailer.send(MailOptions(
            subject: Url.authorEmail['subject'],
            recipients: [Url.authorEmail['address']],
          )),
        ),
      ],
    );
  }
}
