//ovam ću da čuvam boje,  moožda gradijente i šta znam kao na intervjuu
//ovaj put ću u drugom fajlu imati token da nešto odradim sa njim i pokrijem što više iz HTTP da bi
//meni bilo lakše da savladam i ispravim šta nisam uradio tamo (plače mi se bukv)

//prvo definišem boje

import 'package:flutter/material.dart';

Color registerCrvena = Color.fromARGB(185, 196, 6, 6);
Color registerBraon = Color.fromARGB(255, 155, 65, 4);
Color loginSvetloPlava = Color.fromARGB(255, 124, 223, 248);
Color loginZelena = Color.fromARGB(255, 34, 189, 29);

Color regtextCrvena = const Color.fromARGB(255, 243, 50, 36);
Color logintextPlava = Color.fromARGB(255, 7, 218, 255);

RadialGradient registerGradijent = RadialGradient(
  colors: [registerBraon, registerCrvena],
  center: Alignment.center,
  focalRadius: 20,
);

LinearGradient loginGradijent = LinearGradient(
  colors: [loginSvetloPlava, loginZelena],
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  transform: GradientRotation(69),
);

LinearGradient splashGradijent = LinearGradient(
  colors: [
    Color(0xFF42A5F5), // Start color
    Color(0xFF1976D2), // End color
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

Image variuslogo = Image.asset(
  'assets/varius_logo.png',
  width: 150,
  height: 150,
);
