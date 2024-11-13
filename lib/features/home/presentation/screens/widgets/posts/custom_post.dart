import 'package:flutter/material.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Image.asset(
            'assets/posts/3.jpeg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: 390,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            // react in prost....etc

            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 25,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/home/comment11.png',
                    width: 20,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/home/send11.png',
                    width: 22,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/home/save11.png',
                    width: 23,
                  ),
                ),
              ],
            ),
            // numbers of likes....etc
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 5,
              ),
              child: Text(
                '0 '
                'Likes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // username description....etc
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  Text(
                    'UserName',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  'View all 16 comments',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const Text(
              '13/11/2024',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
