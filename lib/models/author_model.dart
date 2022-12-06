class Auther {
  final String firstname;
  final String lastname;
  
  Auther({
    required this.firstname,
    required this.lastname,
  });

  factory Auther.fromJson(Map<String, dynamic> jsonAuther) {
    return Auther(
      firstname: jsonAuther["first_name"],
      lastname: jsonAuther["last_name"],
    );
  }
}
