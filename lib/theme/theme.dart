import 'package:flutter/material.dart';

final darkTheme = ThemeData(
        
        scaffoldBackgroundColor: const Color.fromARGB(172, 36, 36, 35) ,
        useMaterial3: true,
        dividerColor: Colors.white10,

        appBarTheme: const AppBarTheme(
          centerTitle: true,

          color: Color.fromARGB(172, 36, 36, 35),
          iconTheme: IconThemeData(color: Colors.white),

          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        listTileTheme: const ListTileThemeData(iconColor: Colors.white54),
        
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
          
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ), 
        ),
      );