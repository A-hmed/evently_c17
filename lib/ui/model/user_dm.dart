UserDM? currentUser;
class UserDM {
  static UserDM? currentUser;
  String id;
  String email;
  String name;
  String address;
  String phoneNumber;
  List<String> favoriteEvents;

  UserDM({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    this.favoriteEvents = const [],
  });
}
