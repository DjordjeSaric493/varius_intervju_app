import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varius_intervju_app/utils/konstante.dart';
import 'package:varius_intervju_app/utils/rute.dart';
import 'package:varius_intervju_app/view/ekrani/register_ekeran.dart';
import 'package:varius_intervju_app/viewmodel/supabase_auth_servis.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: baseUrl, anonKey: api);
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
        onGenerateRoute:
            AppRouter.generateRoute, // generator ruta preko Navigator-a
        initialRoute: AppRoutes.splash, // splash screen
      ),
    );
  }
}

///TODO:SPLASHSCREEN SA GRADIJENTIMA
