class Pemesanan {
  String name;
  DateTime time;
  int total;
  Pemesanan(this.name,this.time,this.total);
}

List <Pemesanan> listPemesanan1 = [
  new Pemesanan(
    "Perjoeangan", 
    DateTime(2019,7,12), 
    100000),
  new Pemesanan(
    "Deutch", 
    DateTime(2019,8,16), 
    150000),
  new Pemesanan(
    "Mojoekertoe", 
    DateTime(2019,9,1), 
    125000),
];

List <Pemesanan> listPemesanan2 = [];