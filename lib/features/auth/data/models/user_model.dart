import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';

class UserModel extends UserEntite {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }
}
