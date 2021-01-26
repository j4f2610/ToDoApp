import 'package:flutter/material.dart';
import 'package:flutter_app/common/string/StringUtils.dart';
import 'package:flutter_app/ui/modules/home/HomeFragment.dart';
import 'package:flutter_app/ui/modules/home/viewmodel/ToDoVM.dart';
import 'package:flutter_app/ui/modules/new_todo/NewToDoFragment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoVM>(
      create: (_) => ToDoVM(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        initialRoute: StringUtils.HOME_FRAGMENT,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case StringUtils.NEW_TODO_FRAGMENT:
              var todoVM = settings.arguments as ToDoVM;
              return MaterialPageRoute(
                  builder: (context) => NewToDoFragment());
              break;
            default:
              return MaterialPageRoute(builder: (_) => Home());
          }
        },
      ),
    );
  }
}
