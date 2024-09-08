

class UserModel {
  String name;
  String phone;
  String id;
  String email;

  UserModel(
      {required this.name,
      required this.phone,
      required this.id,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"],
        phone: json["phone"],
        id: json["id"],
        email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "phone": phone, "id": id, "email": email};
  }
}
