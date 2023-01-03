// void main() {
//   var mymap = {
//     "idproduk": 1,
//     "nama_produk": "Bolpen",
//     "harga_modal": 1000,
//     "stock": 10,
//     "harga_jual": 2000,
//     "foto": "report.png",
//     "tgl_input": "22 December 2022, 2:55",
//     "userid": 2,
//   };
//   var product = Product.fromJson(mymap);

//   print(product.foto);
// }

// class ProductModel {
//   final int id;
//   final String namaProduk;
//   final int hargaModal;
//   final int stock;
//   final int hargaJual;
//   final String foto;
//   final String tglInput;
//   final int userId;
//   final String username;

//   ProductModel(this.id, this.namaProduk, this.hargaModal, this.stock,
//       this.hargaJual, this.foto, this.tglInput, this.userId, this.username);
// }

class ProductModel {
  int? idproduk;
  String? nama_produk;
  int? harga_modal;
  int? stock;
  int? harga_jual;
  int? foto;
  String? tgl_input;
  int? userid;

  ProductModel(this.idproduk, this.nama_produk, this.harga_modal, this.stock,
      this.harga_jual, this.foto, this.tgl_input, this.userid);

  ProductModel.fromJson(Map<String, dynamic> json) {
    idproduk = json['idproduk'];
    nama_produk = json['nama_produk'];
    harga_modal = json['harga_modal'];
    stock = json['stock'];
    harga_jual = json['harga_jual'];
    foto = json['foto'];
    tgl_input = json['tgl_input'];
    userid = json['userid'];
  }
}
