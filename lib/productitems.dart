import 'package:flutter/material.dart';
import 'package:tokoonlinefauzan/items.dart';
import 'package:tokoonlinefauzan/productdetail.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket, color: Colors.black, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu_open_rounded, color: Colors.black, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Product List",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: (1 / 1.5)),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(productIndex: index,),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            items[index][1],
                            scale: 0.7,
                          ),
                          Text(
                            items[index][0],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              items[index][2],
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
