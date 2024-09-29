import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varius_intervju_app/utils/boje.dart';
import 'package:varius_intervju_app/utils/tekst_sminke.dart';
import 'package:varius_intervju_app/view/home_ekran.dart';
import 'package:varius_intervju_app/viewmodel/supabase_auth_servis.dart';

//pohvatao sam kako da nema stanje već da uzima sve iz kontrolera

class LoginEkran extends StatelessWidget {
  final TextEditingController _usernameControll = TextEditingController();
  final TextEditingController _passwordControll = TextEditingController();
  LoginEkran({super.key});

  @override
  Widget build(BuildContext context) {
    final supaAuthViewModel = Provider.of<SupabaseAuthServis>(context);
    return Scaffold(
      appBar: AppBar(title: loginAppBarText),
      body: Opacity(
        opacity: 0.85,
        child: Container(
          decoration: BoxDecoration(
            gradient: loginGradijent,
          ),
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  TextField(
                    controller: _usernameControll,
                    decoration: InputDecoration(labelText: 'Korisničko ime'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordControll,
                    decoration: InputDecoration(labelText: 'Šifra'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  supaAuthViewModel.ucitava
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            bool success = await supaAuthViewModel.login(
                              _usernameControll.text,
                              _passwordControll.text,
                            );
                            if (success) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeEkran()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        supaAuthViewModel.supaErrorMessage)),
                              );
                            }
                          },
                          child: Text('Loguj se'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
