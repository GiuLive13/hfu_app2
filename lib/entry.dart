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

  Map<String, dynamic> toJson() {
    'id': id;
    'Titel': title;
    'Kontaktdaten': userContact;
    'Beschreibung': description;
  };
}
