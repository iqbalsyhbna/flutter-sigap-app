import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? name;

  const Account({
    this.id,
    this.username,
    this.email,
    this.name,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
  };

  @override
  List<Object?> get props => [id, name, email, username];
}
