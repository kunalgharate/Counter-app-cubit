import 'dart:math';

import 'package:community_app/app-service-connector/bloc/real_login_bloc.dart';
import 'package:community_app/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  var appservice =
      AppServices("communityapp-urbzp", Uri.parse("https://realm.mongodb.com"));
  runApp(MyApp(
    appServices: appservice,
  ));
}

class MyApp extends StatelessWidget {
  final AppServices appServices;
  MyApp({required this.appServices, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (context) => RealLoginBloc(appServices),
            child: MyHomePage(appServices: appServices)));
  }
}



class MyHomePage extends StatefulWidget {
  final AppServices appServices;
  const MyHomePage({super.key, required this.appServices});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Success App")),
      body: BlocBuilder<RealLoginBloc, RealLoginState>(
        builder: (context, state) {
          if (state is RealLoginSuccess) {
            return HomePage(); // Replace with your own HomePage widget
          } else {
            return Failed();
          }
        },
      ),
    );
  
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  void login(){
    final RealLoginBloc authBloc = BlocProvider.of<RealLoginBloc>(context);
    authBloc.add(RealmAppLogin("kunalgharate@gmail.com", "Kunal@123"));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success with login"),
      ),
    );
  }
}

class Failed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error with login"),
      ),
    );
  }
}