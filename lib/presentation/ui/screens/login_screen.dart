

import 'package:delta_lpg_product_sale/presentation/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔺 Red Curved Header
            Stack(
              children: [
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF80CA61), Color(0xFF03b55f)],
                        // colors: AppColors.primaryColorSecondShad02,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 100,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Welcome to Delta LPG",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [

                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'USER NAME',
                  //     hintText: 'John Deo',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     contentPadding:
                  //     const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //   ),
                  // ),
                  const SizedBox(height: 60),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL ADDRESS',
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: '********',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 🔘 Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.redAccent,
                        backgroundColor: Color(0xFF4CAF50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔻 Bottom Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text(
                //   "Already have an account? ",
                //   style: TextStyle(color: Colors.black54),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                    );
                  },
                  child: Text(
                    "Back to Registration",
                    style: TextStyle(
                      // color: Colors.redAccent,
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.bold,
                    ),



                  ),

                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );



    // return Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: Text('This is Login Screen.'),
    //     ),
    //   ),
    // );


  }
}


// Custom Clipper for Curved Header
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
