class Contact {
  //Propriedades
  String name;
  String email;
  String phone;
  String cellPhone;
  String photo;
  String password;

  //Construtor da classe
  int? id;
  Contact({
    this.id,
    required this.name,
    required this.phone,
    required this.photo,
    required this.cellPhone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'photo': photo,
      'cellPhone': cellPhone,
      'email': email,
      'password': password,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      photo: map['photo'],
      cellPhone: map['cellPhone'],
      email: map['email'],
      password: map['password'],
    );
  }
}
