import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final TextEditingController kelasController = TextEditingController();

  // Array list

  List<Map<String, String>> DataList = [];

  void tambahData() {
    setState(() {
      DataList.add({
        'nama': namaController.text,
        'kelas': kelasController.text,
      });
      // untuk membersihkan isi form atau textfield
      namaController.clear();
      kelasController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Data"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: "Nama Siswa",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: kelasController,
                  decoration: InputDecoration(
                    labelText: "Kelas Siswa",
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
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  child: Text(
                    "Tambah",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text("No")),
                          DataColumn(label: Text("Nama Siswa")),
                          DataColumn(label: Text("Kelas")),
                        ],
                        rows: List.generate(
                          DataList.length,
                          (index) => DataRow(cells: [
                            DataCell(Text((index + 1).toString())),
                            DataCell(Text(DataList[index]['nama']!)),
                            DataCell(Text(DataList[index]['kelas']!))
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
