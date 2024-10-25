import 'package:flutter/material.dart';
import 'package:tokoonlinefauzan/items.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, @required this.productIndex});
  final productIndex;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Color buyColor = Colors.blue.shade700;
  int buySize = 5;
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              items[widget.productIndex][0],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: buyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    items[widget.productIndex][1],
                    scale: 0.7,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            items[widget.productIndex][2],
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 5, 0),
                    child: Text(
                      "Description Product",
                      style: TextStyle(
                          color: Colors.blueGrey.shade200,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      items[widget.productIndex][3],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Other Colors",
                  style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.blue.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12.5,
                        backgroundColor: Colors.blue.shade700,
                      ),
                    ),
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.yellow.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12.5,
                        backgroundColor: Colors.yellow.shade700,
                      ),
                    ),
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.green.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12.5,
                        backgroundColor: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.grey.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12.5,
                        backgroundColor: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.red.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12.5,
                        backgroundColor: Colors.red.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Size Options",
                  style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                    value: buySize,
                    items: [
                      DropdownMenuItem(
                        value: 5,
                        child: Text(
                          "S",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 10,
                        child: Text(
                          "L",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 15,
                        child: Text(
                          "M",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 20,
                        child: Text(
                          "X",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 25,
                        child: Text(
                          "XL",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 30,
                        child: Text(
                          "XXL",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        buySize = value!;
                      });
                    }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 20,
            width: 300,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
