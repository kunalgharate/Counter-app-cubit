import 'package:bloc_test/bloc_test.dart';
import 'package:demo_application_one/cubit/counter_cubit.dart';
import 'package:demo_application_one/main.dart'; // Replace with your actual import path
import 'package:demo_application_one/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments and decrements', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CounterCubit(),
          child: MyHomePage(title: 'Test Page'),
        ),
      ),
    );

    expect(find.text('You cant push anymore:'), findsOneWidget);

    expect(find.text('0'), findsOneWidget); // Initial value check

    // Tap the 'Increment' button
    await tester.tap(find.widgetWithIcon(IconButton, Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget); // After increment check

    // Tap the 'Decrement' button
    await tester.tap(find.widgetWithIcon(IconButton, Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsOneWidget); // After decrement check
  });
}
