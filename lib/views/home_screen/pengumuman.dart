import 'package:terapis/global_resource.dart';

class Pengumuman extends StatefulWidget {
  final String teks;

  const Pengumuman({super.key, required this.teks});

  @override
  // ignore: library_private_types_in_public_api
  _PengumumanState createState() => _PengumumanState();
}

class _PengumumanState extends State<Pengumuman> {
  bool _isVisible = true;

  void closeWidget() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Card(
            color: Colors.blue[100],
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.blue[800]),
              title: Text(widget.teks, style: const TextStyle(fontSize: 10)),
              trailing: IconButton(
                icon: const Icon(Icons.close, size: 15),
                onPressed: () {
                  setState(() {
                    _isVisible = false;
                  });
                },
              ),
            ),
          )
        : const SizedBox(); // Mengembalikan widget kosong jika _isVisible false
  }
}
