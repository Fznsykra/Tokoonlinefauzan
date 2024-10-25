import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlinefauzan/addproduct.dart';
import 'package:tokoonlinefauzan/addproduct.dart';
import 'package:tokoonlinefauzan/productupdate.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List productList = [];
  Future<void> deleteProduct(String id) async {
    String urlDeleteProduct =
        "https://ambiguous-observers.000webhostapp.com/deleteproduct.php";
    try {
      var responseDelete =
          await http.post(Uri.parse(urlDeleteProduct), body: {"id": id});
      var deleteDataProduct = jsonDecode(responseDelete.body);
      if (deleteDataProduct["success"] == "true") {
        print("Product successfully deleted");
      } else {
        print("Product failedy deleted");
      }
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> getAllProduct() async {
    String urlProduct =
        "https://ambiguous-observers.000webhostapp.com/getallproduct.php";

    try {
      var response = await http.get(Uri.parse(urlProduct));
      setState(() {
        productList = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Product List",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade400,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(CupertinoIcons.search, color: Colors.white, size: 18),
              SizedBox(width: 10),
              Icon(Icons.notifications, color: Colors.white, size: 18),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              leading: ClipOval(
                child: Image.network(
                  '${productList[index]['images']}',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                productList[index]["name"],
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                productList[index]["description"],
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 9,
                    fontWeight: FontWeight.normal),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(
                      CupertinoIcons.upload_circle_fill,
                      color: Colors.yellow,
                      size: 18,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.delete_solid,
                        color: Colors.red, size: 18),
                    onPressed: () {
                      deleteProduct(productList[index]["id"]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const addProduct()));
        },
        mini: true,
        splashColor: Colors.green.shade300,
        backgroundColor: Colors.green.shade400,
        child: Icon(CupertinoIcons.add_circled, color: Colors.black, size: 12),
      ),
    );
  }
}
