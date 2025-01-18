class UserEntite {
  final String name;
  final String email;
  final String uId;

  UserEntite({required this.name, required this.email, required this.uId});

  toMap() => {'name': name, 'email': email, 'uId': uId};
}
