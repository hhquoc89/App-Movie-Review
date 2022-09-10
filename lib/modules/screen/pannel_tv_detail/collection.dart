import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nameCollecttion = 'Thor Collection';
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/original/3KL8UNKFWgIKXzLHjwY0uwgjzYl.jpg',
          width: double.infinity,
          height: 300,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Part of the ' + nameCollecttion,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () {},
              child: const Text('VIEW THE COLLECTION',
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ]),
      ],
    );
  }
}
