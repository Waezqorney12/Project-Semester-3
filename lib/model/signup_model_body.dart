class signupBody {
  int? id;
  String? username;
  String? password;
  String? email;
  String? alamat;
  String? telepon;

  signupBody(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.alamat,
      this.telepon});
    signupBody.fromJson(Map<String, dynamic> json) {
    id = json['idproduk'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    alamat = json['alamat'];
    telepon = json['telepon'];
  }
}
