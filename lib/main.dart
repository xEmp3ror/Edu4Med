import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'models/index.dart';
import 'ui/pages/auth/index.dart';
import 'ui/pages/home.dart';

/// Main app model
final AppModel model = AppModel();

/// Main app method
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await model.init();
  runApp(CaliforniaApp());
}

class CaliforniaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<AppModel>(
          create: (context) => model,
        ),
        ChangeNotifierProvider(
          create: (context) => DocumentModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TestChapterModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArenaModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserModel(),
        ),
      ],
      child: Consumer<AppModel>(
        builder: (context, model, child) => MaterialApp(
          title: 'Nevada',
          theme: model.requestTheme(Brightness.light),
          darkTheme: model.requestTheme(Brightness.dark),
          home: LoginPage(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/main': (_) => HomePage(),
          },
        ),
      ),
    );
  }
}
