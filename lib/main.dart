import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FormPage());
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nama_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 33, 135, 175),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nama_controller,
                decoration: InputDecoration(
                  labelText: "Nama Siswa",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: password_controller,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HalamanDashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 135, 175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 255, 255, 255),
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

class HalamanDashboard extends StatelessWidget {
  const HalamanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Dashboard"),
        backgroundColor: const Color.fromARGB(255, 33, 135, 175),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text("No")),
                DataColumn(label: Text("Nama Siswa")),
                DataColumn(label: Text("Email")),
              ],
              rows: const <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text("1")),
                  DataCell(Text("Valerie Attila Al-fath")),
                  DataCell(Text("ggwp123@gmail.com")),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("2")),
                  DataCell(Text("Abyandra Syahputra")),
                  DataCell(Text("aby123@gmail.com")),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("3")),
                  DataCell(Text("Boby Maulana")),
                  DataCell(Text("boby123@gmail.com")),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("4")),
                  DataCell(Text("Dodi Rahmatsyah")),
                  DataCell(Text("dodi123@gmail.com")),
                ]),
              ]
            )
          ],
        ),
      ),
    );
  }
}
