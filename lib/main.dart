import 'package:flutter/material.dart';

import 'package:hospital_appointments/screens/department_info.dart';
import 'package:hospital_appointments/screens/departments.dart';
import 'screens/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        Departments.routeName: (context) => const Departments(),
        DepartmentInfo.routeName: (context) => const DepartmentInfo(),
      },
    );
  }
}
