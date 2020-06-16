class User {
  String name, password, email;
  int age;

  User({this.name, this.password, this.email, this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        password: json['password'],
        email: json['email'],
        age: json['age']);
  }
}
