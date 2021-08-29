import 'package:flutter/material.dart';

import '../../../widgets/big_tip.dart';
import 'index.dart';

class ArenaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arena'),
        centerTitle: true,
      ),
      body: BigTip(
        icon: Icons.people_outline,
        message:
            'En este modo podrá competir por equipos con el resto de sus compañeros.',
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: RaisedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ArenaCheckScreen()
            ),
          ),
          color: Theme.of(context).accentColor,
          child: Text('COMENZAR'),
        ),
      ),
    );
  }
}
