import 'package:flutter/material.dart';

class CustomPostBody extends StatelessWidget {
  const CustomPostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/posts/2.jpeg'),
            ),
          ),
          title: Text(
            'UserName',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            'Status',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          trailing: Icon(Icons.more_horiz),
        ),
        Image.asset(
          'assets/posts/1.jpeg',
          fit: BoxFit.fill,
          width: double.infinity,
          height: 390,
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.favorite_border_outlined,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/home/comment11.png',
                    width: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/home/send11.png',
                    width: 22,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Image.asset(
                      'assets/home/save11.png',
                      width: 23,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
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
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
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
            ],
          ),
        ),
      ],
    );
  }
}
