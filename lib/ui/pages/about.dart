import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:package_info/package_info.dart';
import 'package:row_collection/row_collection.dart';

import '../../utils/url.dart';
import '../../widgets/index.dart';

/// ABOUT SCREEN
/// This view contains a list with useful
/// information about the app & its developer.
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo _packageInfo = PackageInfo(
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  initState() {
    super.initState();
    _initPackageInfo();
  }

  // Gets information about the app itself
  Future<Null> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() => _packageInfo = info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        HeaderText('Sobre la app'),
        ListCell.icon(
          icon: Icons.info_outline,
          trailing: Icon(Icons.chevron_right),
          title: 'Versión ${_packageInfo.version}',
          subtitle: 'Arquitectura y Técnología de Computadores',
          onTap: () async => await FlutterWebBrowser.openWebPage(
            url: Url.appUrl,
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
        ),
        Separator.divider(indent: 72),
        ListCell.icon(
          icon: Icons.star_border,
          trailing: Icon(Icons.chevron_right),
          title: '¿Disfrutando de la app?',
          subtitle: 'Deja tu experiencia en la Play Store',
          onTap: () async => await FlutterWebBrowser.openWebPage(
            url: Url.appStore,
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
        ),
        HeaderText('Autores'),
        ListCell.icon(
          icon: Icons.person_outline,
          trailing: Icon(Icons.chevron_right),
          title: 'Por Jesús Rguez. y Rafael Román',
          subtitle: 'Con el asesoramiento de Álvaro Prados',
          onTap: () async => await FlutterWebBrowser.openWebPage(
            url: Url.appUrl,
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
        ),
        Separator.divider(indent: 72),
        ListCell.icon(
          icon: Icons.mail_outline,
          trailing: Icon(Icons.chevron_right),
          title: 'Contacta con nosotros',
          subtitle: 'Reporta fallos o solicita nuevas funciones',
          onTap: () async => await FlutterMailer.send(MailOptions(
            subject: Url.authorEmail['subject'],
            recipients: [Url.authorEmail['address']],
          )),
        ),
        HeaderText('Créditos'),
        ListCell.icon(
          icon: Icons.public,
          trailing: Icon(Icons.chevron_right),
          title: 'Esto es software libre',
          subtitle: 'El código fuente es libre para todos',
          onTap: () async => await FlutterWebBrowser.openWebPage(
            url: Url.appSource,
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
        ),
        Separator.divider(indent: 72),
        ListCell.icon(
          icon: Icons.code,
          trailing: Icon(Icons.chevron_right),
          title: 'Construida con Flutter',
          subtitle: 'Aplicaciones nativas en tiempo récord',
          onTap: () async => await FlutterWebBrowser.openWebPage(
            url: Url.flutterPage,
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
        ),
        Separator.divider(indent: 72),
      ]),
    );
  }
}