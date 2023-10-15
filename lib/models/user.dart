class User {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? birthdate;
  int? roleId;
  String? jwt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.birthdate,
    required this.roleId,
    this.jwt,
  });
}

User currUser = User(
  id: null,
  name: null,
  email: null,
  address: null,
  phone: null,
  birthdate: null,
  roleId: null,
  jwt: null,
);
