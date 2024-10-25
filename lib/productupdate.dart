import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoonlinefauzan/allproduct.dart';

class UpdateProduct extends StatefulWidget {
   final Map product;


  const UpdateProduct({super.key, required this.product});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _nama = TextEditingController();
  final _price = TextEditingController();
  final _description = TextEditingController();
  final _promo = TextEditingController();
  final _images = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nama.text = widget.product['nama'];
    _price.text = widget.product['price'];
    _description.text = widget.product['description'];
    _promo.text = widget.product['promo'];
    _images.text = widget.product['images'];
  }

  Future<void> updateProduct({String id = ""}) async {
    String urlUpdateProduct =
        "https://ambiguous-observers.000webhostapp.com/updateproduct.php";

    try {
      final responseUpdate =
          await http.post(Uri.parse(urlUpdateProduct), body: {
        "id": id.isEmpty ? widget.product["id"] : id,
        "nama": _nama.text.toString(),
        "price": _price.text.toString(),
        "description": _description.text.toString(),
        "promo": _promo.text.toString(),
        "image": _images.text.toString(),
      });

      var updateProduct = json.decode(responseUpdate.body);

      if (updateProduct == "true") {
        print("Product successfully updated");
      } else {
        print("Product update failed");
      }
    } catch (exc) {
      print(exc);
    }
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
          "Update Product",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _nama,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                  hintText: "Entry Product Name",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.shop, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _price,
                decoration: const InputDecoration(
                  labelText: "Price",
                  hintText: "Entry Price",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.pin, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _description,
                decoration: const InputDecoration(
                  labelText: "Description",
                  hintText: "Entry Description",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.description, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: _promo,
                decoration: const InputDecoration(
                  labelText: "Promo",
                  hintText: "Entry Promo",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.discount, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: TextField(
                controller: _images,
                decoration: const InputDecoration(
                  labelText: "Image URL",
                  hintText: "Entry Images URL",
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.image, color: Colors.amber),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 160,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  updateProduct();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllProduct()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(
                        color: Colors.green,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
                child: const Text(
                  "Update Product",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
