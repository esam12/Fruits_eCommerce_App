class UserProfileEntity {
  String? id;
  String? name;
  String? email;

  UserProfileEntity({
    this.id,
    this.name,
    this.email,
  });

  /// to Map
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
