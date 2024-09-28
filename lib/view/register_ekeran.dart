import 'package:flutter/material.dart';


//na intevjuu sam radio kao stf da bi mogao da pratim šta i kako ide
//cilj da su login,register stateless i da interaguju sa viewmodel tj sa kontrolerima
class Registr extends StatelessWidget {
 final TextEditingController _usernameControll = TextEditingController();
  final TextEditingController _passwordControll = TextEditingController();
  final TextEditingController _fullNameControll = TextEditingController();

   Registr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registruj se')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameControll,
              decoration: InputDecoration(labelText: 'Korisničko ime'),
            ),
            TextField(
              controller: _passwordControll,
              decoration: InputDecoration(labelText: 'Šifra'),
              obscureText: true,
            ),
            TextField(
              controller: _fullNameControll,
              decoration: InputDecoration(labelText: 'Puno vime'),
            ),
            SizedBox(height: 20),
            //ako se u auth učitava onda circ progesss indikaroe
            authViewModel.isLoading
                ? CircularProgressIndicator()
                //ako je učitan ideš na elevated button ->probaj da odvojiš 
                : ElevatedButton(
                    onPressed: () async {
                      bool success = await authViewModel.registerUser(
                        _usernameControll.text,
                        _passwordControll.text,
                        _fullNameControll.text,
                      );
                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authViewModel.errorMessage)),
                        );
                      }
                    },
                    child: Text('Registruj se'),
                  ),
                  SizedBox(height: 20,),
                  Text("Imaš nalog?"),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    MaterialPageRoute(builder: (context)=>Login())
                  }, child: Text("Uloguj se ovde")),
                  
          ],
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