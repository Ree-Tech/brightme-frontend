class UserModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? birthdate;
  int? roleId;
  String? gender;
  String? jwt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.birthdate,
    required this.roleId,
    this.gender,
    this.jwt,
  });
}

UserModel currUser = UserModel(
  id: null,
  name: null,
  email: null,
  address: null,
  phone: null,
  birthdate: null,
  roleId: null,
  jwt: null,
  gender: null,
);
