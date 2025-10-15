import 'package:delta_lpg_product_sale/presentation/ui/widgets/appbar/custom_appbar_second.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/drawer/custom_drawer_second.dart';
import '../../widgets/appbar/custom_appbar_second.dart';


class BuyLpgScreen extends StatefulWidget {
  const BuyLpgScreen({super.key});

  @override
  State<BuyLpgScreen> createState() => _BuyLpgScreenState();
}

class _BuyLpgScreenState extends State<BuyLpgScreen> {


  // 🔹 Demo product list (later will be replaced with API data)
  final List<Map<String, String>> products = [
    {
      "name": "12 KG LPG Cylinder",
      "price": "1000",
      "image":
      "assets/images/45_kg_image.png", // demo image
    },
    {
      "name": "25 KG LPG Cylinder",
      "price": "1200",
      "image":
      "assets/images/lp_gas_12_kg.png", // demo image
    },
    {
      "name": "45 KG LPG Cylinder",
      "price": "3300",
      "image":
      "assets/images/lp_gas_12_kg.png", // demo image
    },
    {
      "name": "Bulk LPG Cylinder",
      "price": "5000",
      "image":
      "assets/images/lp_gas_12_kg.png", // demo image
    },
    // {
    //   "name": "45KG LPG Cylinder",
    //   "price": "3800",
    //   "image":
    //   "assets/images/logo_delta_lpg.png", // demo image
    // },
  ];

  // 🔹 Track ordered products
  final Set<int> orderedItems = {};










  /// =========================================================== Scaffold Area ================================================ ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      /// ------------------------------------- AppBar ------------------------------------------------------------------------- ///
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // set your appbar height
        child: CustomAppbarSecond(title: 'Buy LPG'),
      ),

      /// ------------------------------------- Drawer ------------------------------------------------------------------------- ///
      drawer: CustomDrawerSecond(),

      /// ------------------------------------- Body --------------------------------------------------------------------------- ///
      body: SafeArea(
        child: Column(
          children: [
            Expanded( // Expands this whole section
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Out Product List',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    ///----------------------------------------- List View builder ------------------------------ ///
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final isOrdered = orderedItems.contains(index);

                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 3),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  // 🔹 Product Image

                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   child: product['image']!.startsWith('assets/')
                                  //       ? Image.asset(
                                  //     product['image']!,
                                  //     width: 50,
                                  //     height: 50,
                                  //     fit: BoxFit.cover,
                                  //   )
                                  //       : Image.network(
                                  //     product['image']!,
                                  //     width: 50,
                                  //     height: 50,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),



                                  Container(
                                  margin: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      product['image']!,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),


                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                  //   child: Image.asset(
                                  //     product['image']!,
                                  //     width: 50,
                                  //     height: 50,
                                  //     fit: BoxFit.cover,
                                  //   ),


                                    // child: Image.network(
                                    //   product['image']!,
                                    //   width: 50,
                                    //   height: 50,
                                    //   fit: BoxFit.cover,
                                    // ),





                                  const SizedBox(width: 16),

                                  // 🔹 Product Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Product Name
                                        Text(
                                          product['name']!,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 6),

                                        // Product Price
                                        Text(
                                          "৳ ${product['price']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        ),
                                        const SizedBox(height: 12),

                                        // Order Now Button
                                        SizedBox(
                                          height: 36,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                if (isOrdered) {
                                                  orderedItems.remove(index);
                                                } else {
                                                  orderedItems.add(index);
                                                }
                                              });

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(isOrdered
                                                      ? "Order canceled for ${product['name']}."
                                                      : "Order placed for ${product['name']}!"),
                                                  duration:
                                                  const Duration(seconds: 1),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: isOrdered
                                                  ? Colors.green
                                                  : Colors.orange,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              isOrdered
                                                  ? "Ordered"
                                                  : "Order Now",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );



  }
}
