import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key, this.name, this.image, this.capacity});
  final String? name;
  final String? image;
  final String? capacity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Container(
                  height: 260,
                  color: Colors.yellow,
                  padding: const EdgeInsets.only(top: 40, right: 20),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon:
                              Icon(Icons.close, color: Colors.blue.shade800))),
                ),
                Container(
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 128),
                        Center(
                          child: Text(
                            name ?? 'Samsung galaxy65',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            capacity ?? '128 GB',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                        const SizedBox(height: 16),
                        const Text(
                          'About this item',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          """ 1. Snapdragon 4 Gen 2 Mobile Platform : Power efficient 4nm architecture | 16GB of RAM including 8GB Virtual
                    \n2.Display: Large 17.24cm FHD+ 90Hz AdaptiveSync display with Corning Gorilla Glass 3 Protection
                    \n3.Camera: 50MP f/1.8 AI Dual camera with classic film filters, Film Frame, Portrait, Night Mode, 50MP mode, Time-lapse, Google lens | 8MP Selfie camer 5000mAh(typ) battery with 22.5W charger in-box
                    \n4.MIUI Dialer | MIUI 14 with Android 13 | Side fingerprint | IR blaster | 3.5mm Audio jack | IP53 rating """,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 120),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16), // Set the desired border radius
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 260,
                width: 200,
                child: Image.asset(
                  image ?? 'assets/phone_image.jpeg',
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
