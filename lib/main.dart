import 'package:flutter/material.dart';

void main() {
  runApp(KasirApp());
}

class KasirApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: KasirPage(),
    );
  }
}

class KasirPage extends StatefulWidget {
  @override
  _KasirPageState createState() => _KasirPageState();
}

class _KasirPageState extends State<KasirPage> {
  final List<Map<String, dynamic>> barangList = [
    {'kode': '1', 'nama': 'Kemeja', 'harga': 150000},
    {'kode': '2', 'nama': 'Celana', 'harga': 250000},
    {'kode': '3', 'nama': 'Sepatu', 'harga': 400000},
    {'kode': '4', 'nama': 'Kaos', 'harga': 75000},
    {'kode': '5', 'nama': 'Jam Tangan', 'harga': 900000},
  ];

  String? selectedKodeBarang;
  String? selectedCaraBeli;
  int jumlahBarang = 1;

  String namaBarang = "";
  int hargaBarang = 0;
  double diskon = 0.0;
  double totalBayar = 0.0;
  double totalHarga = 0.0;

  final TextEditingController jumlahController =
      TextEditingController(text: "1");

  void hitungTotal() {
    if (selectedKodeBarang == null ||
        selectedCaraBeli == null ||
        jumlahController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua input harus diisi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final selectedBarang =
        barangList.firstWhere((item) => item['kode'] == selectedKodeBarang);

    setState(() {
      namaBarang = selectedBarang['nama'];
      hargaBarang = selectedBarang['harga'];
      jumlahBarang = int.tryParse(jumlahController.text) ?? 1;

      totalHarga = (hargaBarang * jumlahBarang).toDouble();
      diskon = selectedCaraBeli == 'Cash' ? 0.1 * totalHarga : 0.0;
      totalBayar = totalHarga - diskon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Aplikasi Kasir',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown untuk memilih barang
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Pilih Barang',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                value: selectedKodeBarang,
                items: barangList.map((barang) {
                  return DropdownMenuItem<String>(
                    value: barang['kode'],
                    child: Text('${barang['nama']} (Rp ${barang['harga']})'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedKodeBarang = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Input jumlah barang
              TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah Barang',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Dropdown untuk memilih cara beli
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Pilih Cara Beli',
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                value: selectedCaraBeli,
                items: [
                  DropdownMenuItem(value: 'Cash', child: Text('Cash')),
                  DropdownMenuItem(value: 'Credit', child: Text('Credit')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCaraBeli = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Tombol hitung
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: hitungTotal,
                  child: Text('Hitung Total',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),

              SizedBox(height: 32),

              // Tampilan hasil dalam bentuk struk
              if (namaBarang.isNotEmpty) ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('--- Detail Pesanan ---',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue)),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nama Barang'),
                          Text(namaBarang),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Beli'),
                          Text('$jumlahBarang'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Harga Barang'),
                          Text('Rp $hargaBarang'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Diskon'),
                          Text('Rp ${diskon.toStringAsFixed(0)}'),
                        ],
                      ),
                      Divider(
                        height: 10,
                        color: Colors.blue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Bayar',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text('Rp ${totalBayar.toStringAsFixed(0)}',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
