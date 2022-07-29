class Users {
  final String email;

  Users({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
  };

  static Users fromJson(Map<String, dynamic> json) => Users(
    email: json['email'],
  );
}