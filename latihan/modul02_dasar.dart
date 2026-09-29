// ignore_for_file: avoid_print
void main() {
  const double faktorVolumetrik = 6000;

  double beratAktual = 12.4; // kilogram
  double panjang = 90, lebar = 60, tinggi = 50; // sentimeter

  double beratVolumetrik = (panjang * lebar * tinggi) / faktorVolumetrik;
  double beratTertagih = beratAktual > beratVolumetrik
      ? beratAktual
      : beratVolumetrik;

  String kategori;
  if (beratTertagih <= 5) {
    kategori = 'Paket Kecil';
  } else if (beratTertagih <= 20) {
    kategori = 'Paket Sedang';
  } else {
    kategori = 'Kargo';
  }

  print('Berat Aktual: ${beratAktual.toStringAsFixed(2)} kg');
  print('Berat Volumetrik: ${beratVolumetrik.toStringAsFixed(2)} kg');
  print('Berat Tertagih: ${beratTertagih.toStringAsFixed(2)} kg');
  print('Kategori Paket: $kategori');
}
