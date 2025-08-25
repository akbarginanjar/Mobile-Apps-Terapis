import 'package:terapis/controllers/varian_controller.dart';
import 'package:terapis/global_resource.dart';

class VariantCardVertical extends StatelessWidget {
  final VoidCallback? onPress;
  final String namaVarian;
  final String photoVarian;
  final int index;
  final int stok;
  const VariantCardVertical({
    super.key,
    this.onPress,
    required this.namaVarian,
    required this.photoVarian,
    required this.index,
    required this.stok,
  });

  @override
  Widget build(BuildContext context) {
    final VarianController c = Get.find();
    return SizedBox(
      width: 90,
      child: Card(
        color: c.select == index ? Colors.green[100] : Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: c.select == index ? Colors.green : Colors.grey[400]!,
            width: 1,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            c.changeSelect(index);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: photoVarian == 'null'
                    ? Image.network(
                        'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                        height: 70,
                        width: 90,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        photoVarian,
                        height: 70,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, right: 6.0, left: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaVarian,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11),
                    ),
                    Text(
                      'Stok : $stok',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 124, 124, 124),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
