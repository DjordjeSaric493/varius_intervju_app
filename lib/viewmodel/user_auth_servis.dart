import 'package:shared_preferences/shared_preferences.dart';

class UserAuthServis {
  Future<void> odjaviMe() async {
    final prefs = await SharedPreferences.getInstance();
    //KAD SE ODJAVI UKLANJAM TOKEN I FULL NAME ŠTO SAM PROSLEDIO
    await prefs.remove('token');
    await prefs.remove("full_name");
  }

  //bukvalno identične samo što prva uzima token a druga puno ime (iz registracije)
  //asinrono šaljem zahtev pa čekam odgovor od servera
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<String?> getFullName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('full_name');
  }

  //proveravam da l je trenutno ulogovan
  Future<bool> jeUlogovan() async {
    //prvo cimam getToken vraćam TRENUTNO sačuvan token
    final token = await getToken();
    //ako postoji->vrati token u suprotnom vrati null
    return token != null;
    //ako ne vraćam null onda je true, else false
  }
}
