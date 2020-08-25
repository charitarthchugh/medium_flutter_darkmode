import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ThemeChanger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (context) => ThemeChanger(),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        title: 'Charitarth Chugh',
        debugShowCheckedModeBanner: false,
        themeMode: theme.getMode(),
        theme: theme.light,
        darkTheme: theme.dark,
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: (){
              theme.toggle();
            },
            child: Icon(Icons.lightbulb),
            padding: EdgeInsets.all(10.0),
          ),
        ),
      ),
    );
  }
}
