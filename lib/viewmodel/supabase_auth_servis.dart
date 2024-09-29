//kao što mi je rečeno -> PREBACUJEM POSLOVNU LOGIKU U VIEWMODEL

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; //as http da ne javlja grešku kod await http.nešto

class SupabaseAuthServis extends ChangeNotifier {
  final String baseUrl = 'https://zxfrncawjgqqhkhfgfty.supabase.co';
  final String api = '';
  bool ucitava = false;
  String supaErrorMessage = 'GREŠKA!!';

  Future<bool> registrujSe(
      //treba da prosleedim kor ime,šifru i puno ime
      String username,
      String password,
      String fullname) async {
    //asinhrona operacija jer šaljem podatak ka mreži tj čekam odgovor od iste (await)

    //ovde dodajem loading flag gde se vrši http zahtev da je true i provider notifyListeners()
    ucitava = true;
    notifyListeners(); //obavesti o svakoj promeni
    final url = Uri.parse('$baseUrl/korisnici');
    final headeri = {
      'Content-Type': 'application/json',
      'apikey': api,
      'Authorization': 'Bearer $api',
    };

    final body = json.encode({
      'username': username,
      'password': password,
      'full_name': fullname,
      'token': 'token_koji_čekam_', // Ovaj token ćeš kasnije ažurirati
    });
    final serverRespone = await http.post(url, headers: headeri, body: body);

    ucitava = false;
    notifyListeners();

    //ovde postoje dve opcije, ili si se registrovao tj response je 201 ili nisi

    if (serverRespone.statusCode == 201) {
      return true;
    } else {
      //dodaj custom widget da prikazuje neki jak mim tipa jbg nije uspelo
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    //ovde šaljem api i bearer api koji je iz supabase
    final url = Uri.parse('');
    final headers = {
      'apikey': api,
      'Authorization': 'Bearer $api',
    };

    final response = await http.get(url, headers: headers);

    //ako je statcode 200=ok, uspešno što ne mogu reći za ishod tehničkog intervjua
    if (response.statusCode == 200) {
      //šta mi on vraća kao odgovor, parsiram json normalno
      final data = json.decode(response.body);

      //ako ima šta da sačuva ->onda čuvam token i puno ime
      //sharedpreferences kao ključ vrednost, gledao po sata na pub.dev pa skontao na primeru

      if (data.isNotEmpty) {
        final token = data[0]['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('full_name', data[0]['full_name']);
        return true;
      }
    }
    return false;
  }

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

//ne znam da li su ovo najelegantnija rešenja, ako mi iko pametan gleda ovo
//otvoren sam za feedback (ne msm na feedback iz pojačala jer mi treba kinta za isto )
