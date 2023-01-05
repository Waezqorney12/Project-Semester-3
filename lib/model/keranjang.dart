class Keranjang{
    final int? idcart;
    final int? idproduk;
    final String? nama_produk;
    final int? harga;
    final int? harga_modal;
    final String? foto;
    final int? qty;
    final int? userid;
    final int? subtotal;

  Keranjang({this.idcart, this.idproduk, this.nama_produk, this.harga, this.harga_modal, this.foto, this.qty, this.userid, this.subtotal});
  
  factory Keranjang.fromJson(Map<String, dynamic> json){
    return Keranjang(
      idcart: json['idcart'] as int,
      idproduk: json['idproduk'] as int,
      nama_produk: json['nama_produk'] as String,
      harga: json['harga'] as int,
      harga_modal: json['harga_modal'] as int,
      foto: json['foto'] as String,
      qty: json['qty'] as int,
      userid: json['userid'] as int,
      subtotal: json['subtotal'] as int,
      );
  }

  factory Keranjang.fromMap(Map<String, dynamic> map){
    return Keranjang(
      idcart: map['idcart'] as int,
      idproduk: map['idproduk'] as int,
      nama_produk: map['nama_produk'] as String,
      harga: map['harga'] as int,
      harga_modal: map['harga_modal'] as int,
      foto: map['foto'] as String,
      qty: map['qty'] as int,
      userid: map['userid'] as int,
      subtotal: map['subtotal'] as int,
      );
  }

  
}