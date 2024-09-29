import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varius_intervju_app/view/register_ekeran.dart';
import 'package:varius_intervju_app/viewmodel/supabase_auth_servis.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SupabaseAuthServis(), //kreiram instancu supaauthservisa
      child: MaterialApp(
        title: 'MVVM Varius REG/LOGIN SUPAbase rest',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Registr(), //posle ću ubacim splashscreen
      ),
    );
  }
}

///TODO:SPLASHSCREEN SA GRADIJENTIMA
