import 'package:flutter/material.dart';

class HomeDOB1 extends StatefulWidget {
  const HomeDOB1({super.key});

  @override
  _HomeDOB1State createState() => _HomeDOB1State();
}

class _HomeDOB1State extends State<HomeDOB1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _beratBadanController = TextEditingController();
  final TextEditingController _luasLukaBakarController = TextEditingController();
  String _jenisKelamin = 'Pria';

  double? _hasilPerhitungan;

  void _showResultDialog() {
    if (_formKey.currentState!.validate()) {
      final double beratBadan = double.tryParse(_beratBadanController.text) ?? 0;
      final double luasLukaBakar = double.tryParse(_luasLukaBakarController.text) ?? 0;

      // Menggunakan rumus yang disesuaikan
      final double hasil = 4 * beratBadan * luasLukaBakar; // Menghilangkan pembagian 100 di sini

      setState(() {
        _hasilPerhitungan = hasil;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hasil Perhitungan',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Nama Pasien: ${_namaController.text}', style: const TextStyle(color: Colors.black, fontSize: 16)),
                  Text('Umur: ${_umurController.text} tahun', style: const TextStyle(color: Colors.black, fontSize: 16)),
                  Text('Jenis Kelamin: $_jenisKelamin', style: const TextStyle(color: Colors.black, fontSize: 16)),
                  const Divider(color: Colors.teal),
                  Text('Berat Badan: ${_beratBadanController.text} kg', style: const TextStyle(color: Colors.black, fontSize: 16)),
                  Text('Luas Luka Bakar: ${_luasLukaBakarController.text} %', style: const TextStyle(color: Colors.black, fontSize: 16)),
                  const Divider(color: Colors.teal),
                  Text('Hasil Perhitungan: ${_hasilPerhitungan?.toStringAsFixed(2)} ml', style: const TextStyle(color: Colors.black, fontSize: 16)),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK', style: TextStyle(color: Colors.teal, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pasien'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Pasien',
                  labelStyle: const TextStyle(color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan nama pasien';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _umurController,
                decoration: InputDecoration(
                  labelText: 'Umur (tahun)',
                  labelStyle: const TextStyle(color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan umur pasien';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  labelStyle: const TextStyle(color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Pria',
                    child: Text('Pria', style: TextStyle(color: Colors.black)),
                  ),
                  DropdownMenuItem(
                    value: 'Wanita',
                    child: Text('Wanita', style: TextStyle(color: Colors.black)),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap pilih jenis kelamin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'lib/assets/Calculate.jpg',
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _beratBadanController,
                decoration: InputDecoration(
                  labelText: 'Berat Badan (kg)',
                  labelStyle: const TextStyle(color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan berat badan pasien';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _luasLukaBakarController,
                decoration: InputDecoration(
                  labelText: 'Luas Luka Bakar (%)',
                  labelStyle: const TextStyle(color: Colors.teal),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan luas luka bakar pasien';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showResultDialog,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
