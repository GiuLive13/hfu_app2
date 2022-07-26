class Users {
  final String imagePath;
  final String email;

  Users({
    this.imagePath = '',
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'imagePath': imagePath,
  };

  static Users fromJson(Map<String, dynamic> json) => Users(
    email: json['email'],
    imagePath: json['imagePath'],
  );
}