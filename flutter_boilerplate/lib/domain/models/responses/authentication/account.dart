class Account {
  final int? id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;

  Account({
    this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }
}
