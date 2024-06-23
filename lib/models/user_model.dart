class User {
  String? userName;
  String? highScore;

  User({required String this.userName, required String this.highScore});
  User.fromJson(Map<String, dynamic> data) {
    userName = data['username'];
    highScore = data['highScore'];
  }

  Map<String, dynamic> toMap() {
    return {'username': userName, 'highScore': highScore};
  }
}
