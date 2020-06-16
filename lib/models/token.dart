class Token {
  String id, token;

  Token({this.id, this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      id: json['id'],
      token: json['token'],
    );
  }
}
