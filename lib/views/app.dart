import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app_blocs.dart';
import 'package:pos/controllers/blocs/categories_bloc/categories_bloc.dart';
import 'package:pos/views/home.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  
  @override
  void initState() {
    super.initState();
    AppBlocs.categoriesBloc.add(FetchCategories());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocs.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }

  @override
  void dispose() {
    AppBlocs.dispose();
    super.dispose();
  }
}
