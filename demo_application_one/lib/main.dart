import 'package:demo_application_one/cubit/counter_cubit.dart';
import 'package:demo_application_one/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_color_gen/material_color_gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo 2',
        theme: ThemeData(
          primarySwatch: Colors.black.toMaterialColor(),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            actionsIconTheme: IconThemeData(color: Colors.blue),
            backgroundColor: Colors.black,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Demo Testing'),
      ),
    );
  }
}


