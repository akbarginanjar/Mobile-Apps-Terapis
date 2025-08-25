import 'package:terapis/global_resource.dart';

class Carousel extends StatefulWidget {
  final List<String> listImage;
  final bool isLoad;
  const Carousel({super.key, required this.listImage, this.isLoad = false});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.listImage.map((item) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 140,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(
              seconds: 4,
            ), // waktu diam sebelum slide berikutnya
            autoPlayAnimationDuration: const Duration(
              milliseconds: 600,
            ), // durasi transisi cepat
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.listImage.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => {},
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 3.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? Colors.black87
                      : Colors.black26,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
