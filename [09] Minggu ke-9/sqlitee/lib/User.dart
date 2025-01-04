class User {
  final String name;
  final String token;

  User({required this.name, required this.token});

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'token': token,
    };
  }

  // Create User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      token: json['token'],
    );
  }
}