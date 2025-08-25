import 'dart:io';

import 'package:terapis/global_resource.dart';

class ImagePreview extends StatelessWidget {
  final File? imageFile;

  const ImagePreview({Key? key, this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageFile != null
        ? Image.file(imageFile!)
        : const SizedBox(); // Placeholder digunakan jika tidak ada gambar yang dipilih
  }
}
