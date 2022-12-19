class profileModel {
  int id;
  String username;
  String password;
  String email;
  String alamat;
  String telepon;

  profileModel(
      {
      required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.alamat,
      required this.telepon
      });

      factory profileModel.fromJson(Map<String, dynamic> json){
        return profileModel(
          id: json['id'],
          username: json['username'],
          password: json['password'],
          email: json['email'],
          alamat: json['alamat'],
          telepon: json['telepon'],
        );
      }
}
