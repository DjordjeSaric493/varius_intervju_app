import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:varius_intervju_app/utils/boje.dart';
import 'package:varius_intervju_app/viewmodel/supabase_auth_servis.dart';
import 'package:varius_intervju_app/viewmodel/user_auth_servis.dart';

class HomeEkran extends StatelessWidget {
  const HomeEkran({super.key});

  @override
  Widget build(BuildContext context) {
    final supaAuthViewModel = Provider.of<SupabaseAuthServis>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home ',
          style: TextStyle(color: registerCrvena),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await UserAuthServis().odjaviMe();
                Navigator.popUntil(
                    context,
                    (route) =>
                        route.isFirst); //BRIŠI STANJA I VRATI NA POČETNI EKRAN
              },
              icon: Icon(Icons.logout_sharp))
        ],
      ),
      //ovde definišem body
    );
  }
}
