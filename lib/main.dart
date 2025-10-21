import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextfieldToTable(),
    );
  }
}

class TextfieldToTable extends StatefulWidget {
  const TextfieldToTable({super.key});

  @override
  State<TextfieldToTable> createState() => TextfieldPageState();
}

class TextfieldPageState extends State<TextfieldToTable> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();

  // List untuk menyimpan data tabel
  final List<Map<String, String>> dataList = [];

  void tambahData() {
    final String nama = namaController.text;
    final String hargaString = hargaController.text;
    final String jumlahString = jumlahController.text;

    final int? harga = int.tryParse(hargaString);
    final int? jumlah = int.tryParse(jumlahString);

    final int totalBayar = harga! * jumlah!;

    return setState(() {
      dataList.add({
        'nama': nama,
        'harga': harga.toString(),
        'jumlah': jumlah.toString(),
        'total': totalBayar.toString(),
      });
      namaController.clear();
      hargaController.clear();
      jumlahController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Data"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      labelText: "Nama Barang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: hargaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Harga Barang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Jumlah Barang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: tambahData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 135, 175),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    ),
                    child: const Text(
                      "Tambah",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Bagian tabel data
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Nama Barang")),
                    DataColumn(label: Text("Harga Barang")),
                    DataColumn(label: Text("Jumlah Barang")),
                    DataColumn(label: Text("Total Bayar")),
                  ],
                  rows: List.generate(
                    dataList.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text(dataList[index]['nama']!)),
                        DataCell(Text(dataList[index]['harga']!)), // Typo diperbaiki
                        DataCell(Text(dataList[index]['jumlah']!)),
                        DataCell(Text(dataList[index]['total']!)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
