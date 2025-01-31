import 'dart:convert';
import 'package:fruits_hub/features/auth/data/domain/entites/user_entite.dart';
import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
