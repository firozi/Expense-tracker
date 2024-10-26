import 'package:expense_tracker/expense_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 100, 59, 181));

var darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ExpenseChartScreen(),
      darkTheme: ThemeData().copyWith(
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkColorScheme.onSecondary,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: darkColorScheme.surface,
            foregroundColor: darkColorScheme.onPrimaryContainer),
        cardTheme: CardTheme().copyWith(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: darkColorScheme.onPrimaryContainer),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: darkColorScheme.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: darkColorScheme.onPrimaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
          colorScheme: lightColorScheme,
          scaffoldBackgroundColor: lightColorScheme.surface,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: lightColorScheme.onPrimaryContainer,
              foregroundColor: lightColorScheme.primaryContainer),
          cardTheme: CardTheme().copyWith(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: lightColorScheme.secondaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: lightColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                color: lightColorScheme.onPrimaryContainer,
                fontSize: 14,
              ))),
    ),
  );
}
