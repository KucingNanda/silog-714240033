// ignore_for_file: avoid_print
double beratVolumetrik(double p, double l, double t, {double faktor = 6000}) =>
    (p * l * t) / faktor;

double beratTertagih({required double aktual, required double volumetrik}) =>
    aktual > volumetrik ? aktual : volumetrik;

double hitungOngkir({
  required double berat,
  required double tarifPerKg,
  bool asuransi = false,
  double persenAsuransi = 0.005,
  double nilaiBarang = 0,
}) {
  double biaya = berat * tarifPerKg;
  if (asuransi) {
    biaya += nilaiBarang * persenAsuransi;
  }
  return biaya;
}

int estimasiHariSampai(String kota) {
  const Map<String, int> estimasiHari = {
    'Bandung': 1,
    'Surabaya': 2,
    'Makassar': 4,
    'Jayapura': 7,
  };
  return estimasiHari[kota] ?? 5;
}

String rupiah(double nilai) => 'Rp${nilai.toStringAsFixed(0)}';

void main() {
  final volumetrik = beratVolumetrik(45, 30, 25);
  final tertagih = beratTertagih(aktual: 12.4, volumetrik: volumetrik);

  final ongkir = hitungOngkir(
    berat: tertagih,
    tarifPerKg: 8500,
    asuransi: true,
    nilaiBarang: 2500000,
  );

  print('Berat tertagih : ${tertagih.toStringAsFixed(2)} kg');
  print('Ongkos kirim   : ${rupiah(ongkir)}');

  final kota = 'Makassar';
  final estimasi = estimasiHariSampai(kota);
  print('Estimasi tiba  : $estimasi hari (tujuan $kota)');
}
