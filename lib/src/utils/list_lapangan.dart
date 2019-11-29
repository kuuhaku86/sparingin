class Lapangan{
  final String name,
    alamat,
    provinsi,
    image;
  final double rating;
  final int price;
  Lapangan(this.name, this.alamat, this.provinsi, this.image,this.rating,this.price);
}

List <Lapangan> lapangan = [
  new Lapangan(
    "Good Futsal Arena",
    "Lapangan futsal di Surabaya",
    "Jawa Timur",
    "assets/images/lapangan.jpg",
    4.2,
    130000
  ),
  new Lapangan(
    "Amazing Futsal Arena",
    "Lapangan futsal di Mojokerto",
    "Jawa Timur",
    "assets/images/lapangan2.jpg",
    3.8,
    150000
  ),
  new Lapangan(
    "Perjoeangan Futsal Arena",
    "Lapangan futsal di Surabaya",
    "Jawa Timur",
    "assets/images/turnamen2.jpg",
    4.5,
    200000
  ),
];