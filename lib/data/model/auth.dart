import 'package:equatable/equatable.dart';
import 'package:sigap_mobile/data/model/account.dart';

class Auth extends Equatable {
  final Account account;
  final String token;

  const Auth({required this.account, required this.token,});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        account: Account.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": account.toJson(),
        "token": token,
      };

  @override
  List<Object?> get props => [account, token];
}
