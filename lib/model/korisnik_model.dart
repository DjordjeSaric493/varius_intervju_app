class KorisnikModel {
  //ono što mi se traži
  final String username;
  final String password;
  final String fullName;
  final String token;

  KorisnikModel({
    required this.username,
    required this.password,
    required this.fullName,
    required this.token,
  });

  // Kreiraj User objekat iz JSON-a
  factory KorisnikModel.fromJson(Map<String, dynamic> json) {
    return KorisnikModel(
      //koje property-e uzimam
      username: json['username'],
      password: json['password'],
      fullName: json['full_name'],
      token: json['token'],
    );
  }

  // pretvaram korisnik objekat u JSON, ne JSON Statham znam grozan sam loool
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'full_name': fullName,
      'token': token,
    };
  }
}
