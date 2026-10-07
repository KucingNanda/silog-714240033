// ignore_for_file: avoid_print

class ResiTidakDitemukan implements Exception {
  final String resi;
  ResiTidakDitemukan(this.resi);

  @override
  String toString() => 'Resi $resi tidak ditemukan pada basis data.';
}

final Map<String, String> basisResiAsync = {
  'SLG-001': 'Bandung',
  'SLG-002': 'Surabaya',
  'SLG-003': 'Makassar',
  'SLG-004': 'Jayapura',
  'SLG-005': 'Medan',
};

Future<String> ambilStatusKiriman(String resi) async {
  // Simulasi jeda jaringan selama dua detik
  await Future.delayed(const Duration(seconds: 2));
  final kota = basisResiAsync[resi];
  if (kota == null) {
    throw ResiTidakDitemukan(resi);
  }
  return 'Paket $resi sedang dalam perjalanan menuju $kota.';
}

Future<double> ambilOngkir(String resi) async {
  await Future.delayed(const Duration(seconds: 1));
  return 105400;
}

Future<void> bandingkanWaktu() async {
  final mulai = DateTime.now();
  final hasil = await Future.wait([
    ambilStatusKiriman('SLG-001'),
    ambilOngkir('SLG-001'),
  ]);
  final durasi = DateTime.now().difference(mulai);
  print('Status : ${hasil[0]}');
  print('Ongkir : ${hasil[1]}');
  print('Durasi total: ${durasi.inMilliseconds} ms');
}

class HasilPantauan {
  final String resi;
  final bool berhasil;
  final String pesan;

  HasilPantauan({
    required this.resi,
    required this.berhasil,
    required this.pesan,
  });
}

Future<HasilPantauan> pantauSatuResi(String resi) async {
  try {
    final status = await ambilStatusKiriman(resi);
    return HasilPantauan(resi: resi, berhasil: true, pesan: status);
  } on ResiTidakDitemukan catch (e) {
    return HasilPantauan(resi: resi, berhasil: false, pesan: e.toString());
  }
}

Future<void> pantauBanyakResi(List<String> daftarResi) async {
  final hasilSemua = await Future.wait(
    daftarResi.map((resi) => pantauSatuResi(resi)),
  );

  print('--- Hasil Pemantauan ---');
  for (final hasil in hasilSemua) {
    if (hasil.berhasil) {
      print('${hasil.resi}: ${hasil.pesan}');
    } else {
      print('${hasil.resi}: GAGAL - ${hasil.pesan}');
    }
  }
}

Future<void> main() async {
  print('1. Permintaan data dikirim...');
  try {
    final status = await ambilStatusKiriman('SLG-002');
    print('2. $status');
    final ongkir = await ambilOngkir('SLG-002');
    print('3. Ongkos kirim: Rp${ongkir.toStringAsFixed(0)}');
  } on FormatException catch (e) {
    print('Kesalahan format: ${e.message}');
  } catch (e) {
    print('Gagal mengambil data: $e');
  }
  print('4. Proses selesai.');

  await bandingkanWaktu();

  print('\n--- Pengujian Tugas Praktikum ---');

  print('\nSkenario 1: seluruh resi sah');
  await pantauBanyakResi(['SLG-001', 'SLG-002', 'SLG-003']);

  print('\nSkenario 2: terdapat resi tidak sah');
  await pantauBanyakResi(['SLG-001', 'SLG-999', 'SLG-003']);
}
