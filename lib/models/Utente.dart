class Utente {
  final String email;
  final String password;
  final String username;
  final Catalogo catalogo;

  Utente({
    required this.email,
    required this.password,
    required this.username,
    required this.catalogo,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'catalogo': catalogo.toJson(),
    };
  }

  factory Utente.fromJson(Map<String, dynamic> json) {
    return Utente(
      email: json['email'],
      password: json['password'],
      username: json['username'],
      catalogo: Catalogo.fromJson(json['catalogo']),
    );
  }
}

class Catalogo {
  final List<Libro> libri;

  Catalogo({required this.libri});

  Map<String, dynamic> toJson() {
    return {
      'libri': libri.map((libro) => libro.toJson()).toList(),
    };
  }

  factory Catalogo.fromJson(Map<String, dynamic> json) {
    return Catalogo(
      libri: List<Libro>.from(json['libri'].map((libroJson) => Libro.fromJson(libroJson))),
    );
  }

}

class Libro {
  final String id;
  final String titolo;
  final List<String> autori;
  final String copertina;
  final String descrizione;
  final String stato;

  Libro({
    required this.id,
    required this.titolo,
    required this.autori,
    required this.copertina,
    required this.descrizione,
    required this.stato,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titolo': titolo,
      'autori': autori,
      'copertina': copertina,
      'descrizione': descrizione,
      'stato': stato,
    };
  }

  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(
      id: json['id'],
      titolo: json['titolo'],
      autori: List<String>.from(json['autori']),
      copertina: json['copertina'],
      descrizione: json['descrizione'],
      stato: json['stato'],
    );
  }
}
