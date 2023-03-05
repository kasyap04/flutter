import 'package:flutter/material.dart';
import 'package:ridhiks/colors.dart';

class PopulartPorductView extends StatefulWidget {
  @override
  State<PopulartPorductView> createState() => PopulartPorductViewState();
}

class PopulartPorductViewState extends State<PopulartPorductView> {
  void productPressed(dynamic productId) {
    print("PRODUCT CLICKED id: $productId");
  }

  void favIconPressed(dynamic productId) {
    print("FAV BUTTON CLICKED id: $productId");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    dynamic width = (size.width / 2) - 30;
    dynamic height = width + 20;
    // print(size.width - 30);
    return GridView.count(
      childAspectRatio: width / height,
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        ProductList(
          isFav: true,
          productName: "Black long dress",
          productPressed: () => productPressed(1),
          favIconPressed: () => favIconPressed(1),
        ),
        ProductList(
          isFav: false,
          productName: "White T-Shirt",
          productPressed: () => productPressed(2),
          favIconPressed: () => favIconPressed(2),
        ),
      ],
    );
  }
}

class ProductList extends StatefulWidget {
  final bool isFav;
  final String productName;
  final void Function() productPressed;
  final void Function() favIconPressed;
  ProductList(
      {required this.isFav,
      required this.productName,
      required this.productPressed,
      required this.favIconPressed});
  @override
  State<ProductList> createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  late bool favProduct;
  @override
  void initState() {
    super.initState();
    favProduct = widget.isFav;
  }

  void favButtonClicked() {
    setState(() {
      favProduct = !favProduct;
      widget.favIconPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    dynamic width = (size.width / 2) - 30;
    dynamic height = width + 20;

    return InkWell(
      onTap: widget.productPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: 2)
            ]),
        child: Column(
          children: [
            Container(
              height: height - 28,
              color: AppColor().searchBarColor,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.network(
                        "https://www.pngmart.com/files/15/Apple-iPhone-12-PNG-Photo.png",
                        height: height - 22 - 30),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        // height: 20,
                        // width: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: InkWell(
                            onTap: favButtonClicked,
                            child: Icon(
                              favProduct == true
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 17,
                              color: Colors.red,
                            )),
                      ))
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              widget.productName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
