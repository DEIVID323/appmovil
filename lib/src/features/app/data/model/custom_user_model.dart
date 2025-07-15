import 'package:jdphotomap/src/features/app/domain/entity/custom_user_entity.dart';

class CustomUserModel extends CustomUserEntity {
  const CustomUserModel({required super.email, required super.name});
  factory CustomUserModel.fromJson({required Map<String, dynamic> json}) {
    return CustomUserModel(
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }
}
