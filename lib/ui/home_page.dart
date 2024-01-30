import 'package:e_commerce_app/get_it.dart';
import 'package:e_commerce_app/ui/item_detailPage.dart';
import 'package:e_commerce_app/store/book_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(viewportFraction: 0.9, initialPage: 0);
  List<String> images = [
    'assets/banner.jpg',
    'assets/banner2.jpg',
    'assets/banner3.jpg',
  ];

  List<String> phoneImages = [
    'assets/phone1.PNG',
    'assets/phone2.PNG',
    'assets/phone3.PNG',
    'assets/phone4.PNG',
    'assets/phone6.PNG',
    'assets/phone7.PNG',
  ];
  int index = 1;

  @override
  void initState() {
    final store = getIt.get<BookStore>();
    store.fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = getIt.get<BookStore>();

    return Scaffold(
      appBar: AppBar(
          actions: const [Icon(Icons.shopping_cart)],
          title: const Text('Discover')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                    itemCount: 3,
                    controller: controller,
                    onPageChanged: (int? val) {
                      setState(() {
                        index = val ?? 0;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset(
                              images.elementAt(index),
                              height: 600,
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: controller,
                            count: images.length,
                            effect: const WormEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Colors.white,
                              dotColor: Color(0xFFA7A6A6),
                              type: WormType.thinUnderground,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 20),
              const Text(
                'Best Seller',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 280,
                child: Observer(builder: (_) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: store.dataList.value.value?.length ?? 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemDetailPage(
                                capacity: store.dataList.value.value
                                        ?.elementAt(index)
                                        .data
                                        ?.capacity ??
                                    '128 GB',
                                name: store.dataList.value.value
                                        ?.elementAt(index)
                                        .name ??
                                    'Samsung',
                                image: phoneImages[index % images.length],
                              ),
                            ),
                          );
                        },
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),

                              // color: Colors.pink,
                            ),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  phoneImages[index % images.length],
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                store.dataList.value.value
                                        ?.elementAt(index)
                                        .name ??
                                    'Samsung',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 8),
                              _buildRow(store, index,
                                  subtitle: store.dataList.value.value
                                          ?.elementAt(index)
                                          .data
                                          ?.capacity ??
                                      '128 GB',
                                  title: 'Capacity'),
                              const SizedBox(height: 8),
                              _buildRow(store, index,
                                  subtitle: store.dataList.value.value
                                          ?.elementAt(index)
                                          .data
                                          ?.color ??
                                      'blue',
                                  title: 'Color'),
                            ]),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 16,
                      );
                    },
                  );
                }),
              ),
              const Text(
                'Trending',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: Observer(builder: (_) {
                  return ListView.builder(
                      itemCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/phone_image.jpeg',
                              fit: BoxFit.fitHeight,
                              height: 160,
                              width: 160,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  store.dataList.value.value
                                          ?.elementAt(index)
                                          .name ??
                                      'Samsung',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    'Capacity',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue.shade800),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    '124GB',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ]);
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRow(BookStore store, int index, {String? title, String? subtitle}) {
    return Row(
      children: [
        Text(
          title ?? 'Capacity',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade800),
        ),
        const Spacer(),
        Text(
          subtitle ?? 'No data',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ],
    );
  }
}
