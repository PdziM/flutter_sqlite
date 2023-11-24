import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'core/constants/constants.dart';
import 'main_state.dart';
import 'presentation/note/list/note_list_view.dart';
import 'services/sqflite/interfaces/database_sql_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseSqlInterface>(create: (_) => Config.database),
        ListenableProvider<MainState>(create: (_) => MainState(context))
      ],
      child: Consumer<MainState>(builder: (_, state, __) {
        return MaterialApp(
          title: 'SQLite Demo',
          debugShowCheckedModeBanner: false,
          locale: const Locale('pt'),
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: state.darkTheme ? ThemeMode.dark : ThemeMode.light,
          home: const NoteListView(),
        );
      }),
    );
  }
}
