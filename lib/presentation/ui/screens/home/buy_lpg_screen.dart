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


  /// =========================================================== Show Dialog ================================================ ///
  void _showOrderDialog(Map<String, String> product, int index) {
    int qty = 1;
    String type = 'Refill';
    final int unitPrice = int.tryParse(product['price'] ?? '0') ?? 0;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final total = unitPrice + (type == 'New' ? 2000 : 0);
            return AlertDialog(
              contentPadding: const EdgeInsets.all(12),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.45,

                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Left: Product image
                          Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: product['image']!.startsWith('assets/')
                                  ? Image.asset(product['image']!, fit: BoxFit.cover)
                                  : Image.network(product['image']!, fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Right: Details & controls
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Title
                                Text(
                                  product['name'] ?? '',
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),

                                // Price
                                Text(
                                  '৳ ${total.toString()}',
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                                ),
                                const SizedBox(height: 6),
                                Text('Total: ৳ ${ (total * qty).toString() }', style: const TextStyle(color: Colors.black54)),

                                // Quantity selector
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (qty > 1) setState(() => qty -= 1);
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                                      child: Text(qty.toString(), style: const TextStyle(fontSize: 16)),
                                    ),
                                    IconButton(
                                      onPressed: () => setState(() => qty += 1),
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),




                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(
                              // style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent[700]),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amberAccent[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // 👈 Rounded corners (3 radius)
                                ),
                              ),

                              onPressed: () {
                                setState(() {
                                  // add to cart: track by index (you can extend to store qty & type)
                                  this.setState(() => orderedItems.add(index));
                                });
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Added ${product['name']} x$qty to cart')),
                                );
                              },
                              child: const Text('Add to Cart'),
                            ),
                          ),
                          const SizedBox(width: 5),

                          SizedBox(
                            height: 40,
                            width: 110,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // 👈 Rounded corners (3 radius)
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Handle buy now (navigate to checkout or perform action)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Buying ${product['name']} x$qty')),
                                );
                              },
                              child: const Text('Buy Now'),
                            ),
                          )

                        ],
                      ),




                    ],
                  ),
                ),


                // child: Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Text(
                //       product['name'] ?? '',
                //       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //     ),
                //     const SizedBox(height: 20),
                //     Text(
                //       'Price: ৳ ${unitPrice.toString()}',
                //       style: const TextStyle(fontSize: 18, color: Colors.black87),
                //     ),
                //     const SizedBox(height: 10),
                //     Text(
                //       'Total: ৳ ${(total * qty).toString()}',
                //       style: const TextStyle(fontSize: 18, color: Colors.black87),
                //     ),
                //     const SizedBox(height: 20),
                //     // Additional controls (type selection, quantity selector, actions) can be added here
                //   ],
                // ),










                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     // Left: Product image
                //     Container(
                //       width: 50,
                //       height: 50,
                //       padding: const EdgeInsets.all(8),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: product['image']!.startsWith('assets/')
                //             ? Image.asset(product['image']!, fit: BoxFit.cover)
                //             : Image.network(product['image']!, fit: BoxFit.cover),
                //       ),
                //     ),
                //
                //     const SizedBox(width: 16),
                //
                //     // Right: Details & controls
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           // Title + close
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Expanded(
                //                 child: Text(
                //                   product['name'] ?? '',
                //                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               InkWell(
                //                 onTap: () => Navigator.of(context).pop(),
                //                 child: const Icon(Icons.close),
                //               ),
                //             ],
                //           ),
                //           const SizedBox(height: 8),
                //
                //           // Price
                //           Text(
                //             '৳ ${total.toString()}',
                //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                //           ),
                //           const SizedBox(height: 6),
                //           Text('Total: ৳ ${ (total * qty).toString() }', style: const TextStyle(color: Colors.black54)),
                //
                //           const SizedBox(height: 12),
                //
                //           // Type selection
                //           Text('Type', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700])),
                //           const SizedBox(height: 8),
                //           Row(
                //             children: [
                //               OutlinedButton(
                //                 onPressed: () => setState(() => type = 'Refill'),
                //                 style: OutlinedButton.styleFrom(
                //                   side: BorderSide(color: type == 'Refill' ? Colors.blue : Colors.grey),
                //                 ),
                //                 child: Text('Refill', style: TextStyle(color: type == 'Refill' ? Colors.blue : Colors.black)),
                //               ),
                //               const SizedBox(width: 8),
                //               OutlinedButton(
                //                 onPressed: () => setState(() => type = 'New'),
                //                 style: OutlinedButton.styleFrom(
                //                   side: BorderSide(color: type == 'New' ? Colors.blue : Colors.grey),
                //                 ),
                //                 child: Text('New  + 2,000 ৳', style: TextStyle(color: type == 'New' ? Colors.blue : Colors.black)),
                //               ),
                //             ],
                //           ),
                //
                //           const SizedBox(height: 12),
                //
                //           // Quantity selector
                //           Row(
                //             children: [
                //               IconButton(
                //                 onPressed: () {
                //                   if (qty > 1) setState(() => qty -= 1);
                //                 },
                //                 icon: const Icon(Icons.remove),
                //               ),
                //               Container(
                //                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                //                 decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                //                 child: Text(qty.toString(), style: const TextStyle(fontSize: 16)),
                //               ),
                //               IconButton(
                //                 onPressed: () => setState(() => qty += 1),
                //                 icon: const Icon(Icons.add),
                //               ),
                //             ],
                //           ),
                //
                //           const SizedBox(height: 12),
                //
                //           // Actions: Add to Cart / Buy Now
                //           Row(
                //             children: [
                //               Expanded(
                //                 child: ElevatedButton(
                //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700]),
                //                   onPressed: () {
                //                     setState(() {
                //                       // add to cart: track by index (you can extend to store qty & type)
                //                       this.setState(() => orderedItems.add(index));
                //                     });
                //                     Navigator.of(context).pop();
                //                     ScaffoldMessenger.of(context).showSnackBar(
                //                       SnackBar(content: Text('Added ${product['name']} x$qty to cart')),
                //                     );
                //                   },
                //                   child: const Text('Add to Cart'),
                //                 ),
                //               ),
                //               const SizedBox(width: 12),
                //               Expanded(
                //                 child: ElevatedButton(
                //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                //                   onPressed: () {
                //                     Navigator.of(context).pop();
                //                     // Handle buy now (navigate to checkout or perform action)
                //                     ScaffoldMessenger.of(context).showSnackBar(
                //                       SnackBar(content: Text('Buying ${product['name']} x$qty')),
                //                     );
                //                   },
                //                   child: const Text('Buy Now'),
                //                 ),
                //               ),
                //             ],
                //           ),
                //
                //           const SizedBox(height: 8),
                //           InkWell(
                //             onTap: () {
                //               // optional: open full details
                //               Navigator.of(context).pop();
                //             },
                //             child: const Text('View full details →', style: TextStyle(color: Colors.blue)),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),





              ),
            );
          },
        );
      },
    );



  }













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

                                        // -------------------------------- Order Now Button -------------------------------- //
                                        SizedBox(
                                          height: 36,
                                          child: ElevatedButton(


                                            onPressed: () {
                                              setState(() {

                                                _showOrderDialog(product, index);

                                                // if (isOrdered) {
                                                //   orderedItems.remove(index);
                                                // } else {
                                                //   orderedItems.add(index);
                                                // }

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
