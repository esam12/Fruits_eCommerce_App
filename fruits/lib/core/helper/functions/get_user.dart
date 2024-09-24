import 'dart:convert';

import 'package:fruits/core/utils/constants/constants.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/core/services/shared_preferences_singleton.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}