import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:varius_intervju_app/utils/boje.dart';
import 'package:varius_intervju_app/utils/tekst_sminke.dart';
import 'package:varius_intervju_app/view/login_ekran.dart';
import 'package:varius_intervju_app/viewmodel/supabase_auth_servis.dart';

//na intevjuu sam radio kao stf da bi mogao da pratim šta i kako ide
//cilj da su login,register stateless i da interaguju sa viewmodel tj sa kontrolerima
class Registr extends StatelessWidget {
  final TextEditingController _usernameControll = TextEditingController();
  final TextEditingController _passwordControll = TextEditingController();
  final TextEditingController _fullNameControll = TextEditingController();

  Registr({super.key});

  @override
  Widget build(BuildContext context) {
    final supaAuthViewModel = Provider.of<SupabaseAuthServis>(context);

    return Scaffold(
      appBar: AppBar(
        title: regAppBarText,
      ),
      body: Opacity(
        opacity: 0.9,
        child: Container(
          decoration: BoxDecoration(
            gradient: registerGradijent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 60),
                TextField(
                  controller: _usernameControll,
                  decoration: InputDecoration(labelText: 'Korisničko ime'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordControll,
                  decoration:
                      InputDecoration(labelText: 'Šifra-> MIN 6 KARAKTERA'),
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                ),
                TextField(
                  controller: _fullNameControll,
                  decoration: InputDecoration(labelText: 'Puno ime'),
                ),
                SizedBox(height: 20),
                //ako se u auth učitava onda circ progesss indikaroe
                supaAuthViewModel
                        .ucitava //ovde treba provider da prati jel ulogovan
                    ? CircularProgressIndicator()
                    //ako je učitan ideš na elevated button ->probaj da odvojiš
                    : ElevatedButton(
                        onPressed: () async {
                          bool success = await supaAuthViewModel.registrujSe(
                            _usernameControll.text,
                            _passwordControll.text,
                            _fullNameControll.text,
                          );
                          if (success) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginEkran()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      SupabaseAuthServis().supaErrorMessage)),
                            );
                          }
                        },
                        child: Text('Registruj se'),
                      ),
                SizedBox(
                  height: 20,
                ),
                Text("Imaš nalog?"),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginEkran()),
                      );
                    },
                    child: Text("Uloguj se ovde")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* TODO: DJORDJE

ZA DALJE, 
NAPRAVITI U AUTHVIEWMODEL FUNKCIJE : -login         -server response    -token
                                     - register     -odjava korisnika (sharedpreferences.clean)
                                     -  ubaciti u provider notifylisteners vamonamo
(ODVOJITI POSLOVNU LOGIKU OD DIZAJNA)
odo na svadbu da ločem 
*/
