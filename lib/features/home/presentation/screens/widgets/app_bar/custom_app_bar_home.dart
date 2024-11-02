import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/login_out/instatextw-removebg-preview.png',
                  width: 100,
                  height: 40,
                ),
                const SizedBox(
                  width: 5,
                ),
                Transform.rotate(
                  angle: 4.71239,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/home/message11.png',
                  width: 23,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.add_box_outlined,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
