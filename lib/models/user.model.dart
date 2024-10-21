
class Location {
  String country;
  String city;

  Location({
    required this.country,
    required this.city,
  });
}

// Creates a user object from Json
class User {
  final String id;
  String username;
  String email;
  final String role;
  String? profilePic;
  String dob;
  Location location;
  bool emailVerified;
  String language;
  String gender;
  final String platform;
  List<String> categories;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    this.profilePic,
    required this.dob,
    required this.location,
    required this.emailVerified,
    required this.language,
    required this.gender,
    required this.platform,
    required this.categories,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      dob: json['dob'],
      location: Location(
        country: json['location']['country'],
        city: json['location']['city'],
      ),
      emailVerified: json['emailVerified'],
      language: json['language'],
      gender: json['gender'],
      platform: json['platform'],
      categories: List<String>.from(json['categories']),
    );
  }
}