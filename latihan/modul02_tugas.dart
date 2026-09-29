// ignore_for_file: avoid_print
// Fungsi menentukan kategori paket berdasarkan berat
String tentukanKategori(double berat) {
  if (berat <= 5) {
    return 'Paket Kecil';
  } else if (berat <= 20) {
    return 'Paket Sedang';
  } else {
    return 'Kargo';
  }
}

// Fungsi menghitung total berat seluruh kiriman
double hitungTotalBerat(List<Map<String, Object>> kiriman) {
  double total = 0;
  for (final item in kiriman) {
    total += item['berat'] as double;
  }
  return total;
}

// Fungsi menghitung rata-rata berat
double hitungRataRataBerat(List<Map<String, Object>> kiriman) {
  final total = hitungTotalBerat(kiriman);
  return total / kiriman.length;
}

// Fungsi mencari kiriman dengan berat terberat
Map<String, Object> cariKirimanTerberat(List<Map<String, Object>> kiriman) {
  Map<String, Object> terberat = kiriman.first;
  for (final item in kiriman) {
    final beratItem = item['berat'] as double;
    final beratTerberat = terberat['berat'] as double;
    if (beratItem > beratTerberat) {
      terberat = item;
    }
  }
  return terberat;
}

// Fungsi mencari kiriman dengan berat teringan
Map<String, Object> cariKirimanTeringan(List<Map<String, Object>> kiriman) {
  Map<String, Object> teringan = kiriman.first;
  for (final item in kiriman) {
    final beratItem = item['berat'] as double;
    final beratTeringan = teringan['berat'] as double;
    if (beratItem < beratTeringan) {
      teringan = item;
    }
  }
  return teringan;
}

// Fungsi menghitung jumlah kiriman pada tiap kategori
Map<String, int> hitungJumlahPerKategori(List<Map<String, Object>> kiriman) {
  final Map<String, int> jumlahKategori = {
    'Paket Kecil': 0,
    'Paket Sedang': 0,
    'Kargo': 0,
  };
  for (final item in kiriman) {
    final berat = item['berat'] as double;
    final kategori = tentukanKategori(berat);
    jumlahKategori[kategori] = (jumlahKategori[kategori] ?? 0) + 1;
  }
  return jumlahKategori;
}

void main() {
  final List<Map<String, Object>> kiriman = [
    {'resi': 'SLG-101', 'kota': 'Bandung', 'berat': 2.5},
    {'resi': 'SLG-102', 'kota': 'Surabaya', 'berat': 12.5},
    {'resi': 'SLG-103', 'kota': 'Makassar', 'berat': 7.2},
    {'resi': 'SLG-104', 'kota': 'Surabaya', 'berat': 4.0},
    {'resi': 'SLG-105', 'kota': 'Jayapura', 'berat': 25.0},
    {'resi': 'SLG-106', 'kota': 'Bandung', 'berat': 1.8},
    {'resi': 'SLG-107', 'kota': 'Jayapura', 'berat': 30.5},
    {'resi': 'SLG-108', 'kota': 'Makassar', 'berat': 15.0},
  ];

  final totalBerat = hitungTotalBerat(kiriman);
  final rataRataBerat = hitungRataRataBerat(kiriman);
  final terberat = cariKirimanTerberat(kiriman);
  final teringan = cariKirimanTeringan(kiriman);
  final jumlahKategori = hitungJumlahPerKategori(kiriman);

  print('--- Rekap Kiriman ---');
  print('Jumlah kiriman   : ${kiriman.length}');
  print('Total berat      : ${totalBerat.toStringAsFixed(2)} kg');
  print('Rata-rata berat  : ${rataRataBerat.toStringAsFixed(2)} kg');
  print(
    'Kiriman terberat : ${terberat['resi']} (${terberat['kota']}, ${terberat['berat']} kg)',
  );
  print(
    'Kiriman teringan : ${teringan['resi']} (${teringan['kota']}, ${teringan['berat']} kg)',
  );

  print('\n--- Jumlah per Kategori ---');
  jumlahKategori.forEach((kategori, jumlah) {
    print('$kategori : $jumlah kiriman');
  });
}
