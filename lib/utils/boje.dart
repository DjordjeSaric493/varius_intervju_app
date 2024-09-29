//ovam ću da čuvam boje,  moožda gradijente i šta znam kao na intervjuu
//ovaj put ću u drugom fajlu imati token da nešto odradim sa njim i pokrijem što više iz HTTP da bi
//meni bilo lakše da savladam i ispravim šta nisam uradio tamo (plače mi se bukv)

//prvo definišem boje

import 'package:flutter/material.dart';

Color registerCrvena = Color.fromARGB(185, 196, 6, 6);
Color registerCrnaBraon = Color.fromARGB(255, 80, 33, 2);
Color loginSvetloPlava = Color.fromARGB(255, 124, 223, 248);
Color loginZelena = Color.fromARGB(255, 34, 189, 29);

Color regtextCrvena = const Color.fromARGB(255, 243, 50, 36);
Color logintextPlava = Color.fromARGB(255, 7, 218, 255);

RadialGradient registerGradijent = RadialGradient(
  colors: [registerCrvena, registerCrnaBraon],
  center: Alignment.center,
  focalRadius: 49.3,
);

LinearGradient loginGradijent = LinearGradient(
  colors: [loginSvetloPlava, loginZelena],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  transform: GradientRotation(69),
);
