import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Discussion extends StatelessWidget {
  const Discussion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        card1(),
        const SizedBox(
          height: 10,
        ),
        card(),
        const SizedBox(
          height: 10,
        ),
        card1(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

Widget card1() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.grey)),
    width: 375,
    padding: const EdgeInsets.all(20),
    child: Center(
        child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://image.tmdb.org/t/p/w300/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg',
              ),
              radius: 26,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.all(8),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  const Text(
                    'Post office',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Open'), const Text('6')],
            ),
            Container(
                alignment: Alignment.centerRight,
                width: 100,
                child: Wrap(
                  children: [
                    const Text(
                      'Apr 23, 2022 at 4:34 AM by OddRob',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ))
          ],
        ),
      ],
    )),
  );
}

Widget card() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.grey)),
    width: 375,
    padding: const EdgeInsets.all(20),
    child: Center(
        child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://image.tmdb.org/t/p/w300/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg',
              ),
              radius: 26,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.all(8),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  const Text(
                    'Wanna understand this movie? You HAVE to watch the Disney+ show..or else..Wanna understand this movie? You HAVE to watch the Disney+ show..or else..',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Open'), const Text('6')],
            ),
            Container(
                alignment: Alignment.centerRight,
                width: 100,
                child: Wrap(
                  children: [
                    const Text(
                      'Apr 23, 2022 at 4:34 AM by OddRob',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ))
          ],
        ),
      ],
    )),
  );
}
