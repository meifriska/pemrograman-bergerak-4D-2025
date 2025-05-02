import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Wisata {
  final String nama;
  final String lokasi;
  final String jenis;
  final String harga;
  final String deskripsi;
  final File? gambar;

  Wisata({
    required this.nama,
    required this.lokasi,
    required this.jenis,
    required this.harga,
    required this.deskripsi,
    this.gambar,
  });
}

class TambahWisataPage extends StatefulWidget {
  @override
  _TambahWisataPageState createState() => _TambahWisataPageState();
}

class _TambahWisataPageState extends State<TambahWisataPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _lokasiController = TextEditingController();
  final _hargaController = TextEditingController();
  final _deskripsiController = TextEditingController();

  String? _selectedJenis;
  final List<String> _jenisWisata = ['Pantai', 'Gunung', 'Budaya', 'Kuliner'];
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("Gagal memilih gambar atau dibatalkan.");
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _lokasiController.dispose();
    _hargaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Wisata'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: _image == null
                      ? const Icon(Icons.add_photo_alternate_outlined,
                          size: 60, color: Colors.grey)
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Upload Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Nama Wisata
              buildTextField(label: 'Nama Wisata', controller: _namaController),
              const SizedBox(height: 12),

              // Lokasi Wisata
              buildTextField(label: 'Lokasi Wisata', controller: _lokasiController),
              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: const Text('Jenis Wisata:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: _selectedJenis,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                hint: const Text('Pilih Jenis Wisata'),
                items: _jenisWisata.map((jenis) {
                  return DropdownMenuItem<String>(
                    value: jenis,
                    child: Text(jenis),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedJenis = value;
                  });
                },
              ),
              const SizedBox(height: 12),

              // Harga Tiket
              buildTextField(label: 'Harga Tiket', controller: _hargaController, keyboardType: TextInputType.number),
              const SizedBox(height: 12),

              // Deskripsi
              buildTextField(label: 'Deskripsi', controller: _deskripsiController, maxLines: 3),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final wisata = Wisata(
                      nama: _namaController.text,
                      lokasi: _lokasiController.text,
                      jenis: _selectedJenis ?? '',
                      harga: _hargaController.text,
                      deskripsi: _deskripsiController.text,
                      gambar: _image,
                    );
                    Navigator.pop(context, wisata);
                  }
                },
                child: const Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 31, 49, 149),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _formKey.currentState?.reset();
                  _namaController.clear();
                  _lokasiController.clear();
                  _hargaController.clear();
                  _deskripsiController.clear();
                  setState(() {
                    _selectedJenis = null;
                    _image = null;
                  });
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Color.fromARGB(255, 29, 41, 111)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label :', style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap isi $label';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Masukkan $label Disini',
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
