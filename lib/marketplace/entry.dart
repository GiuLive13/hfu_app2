class Entry {
  String id;
  final String title;
  final String userContact;
  final String description;

  Entry({
    this.id = '',
    required this.title,
    required this.userContact,
    required this.description
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'userContact': userContact,
    'description': description
  };

  static Entry fromJson(Map<String, dynamic> json) => Entry(
    id: json['id'],
    title: json['title'],
    userContact: json['userContact'],
    description: json['description']
  );

}