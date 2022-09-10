import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.grey)),
        width: 375,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://image.tmdb.org/t/p/w300/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg',
                ),
                radius: 26,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'A review by garethmb',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                        const TextSpan(text: 'Written by '),
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: 'garethmb',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                        const TextSpan(text: ' on July 5,2022')
                      ])),
                ],
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 20,
              text: const TextSpan(
                children: [
                  TextSpan(
                      text:
                          'The God of Thunder returns in Marvel Studios\’ “Thor: Love and Thunder” and audiences find that Thor (Chris Hemsworth), has been doing missions with the Guardians of the Galaxy while he works himself back into shape and looks to find a new purpose in life.Thor has been taking the spotlight in many of the missions and when multiple calls for help arise, Thor opts to go off on his own to address a particular call for help while the Guardians head on their way to help others.It is learned that a being named Gorr (Christian Bale) has been killing Gods and Thor is eager to put a stop to him before he can do more damage. His mission soon puts him on a collision course with Gorr and The Mighty Thor (Natalie Portman) who being his ex and wielding his former weapon causes more than a few funny and awkward moments.In a race to save captured children, rally the gods, and defeat Gorr, Thor, and Jane along with Korr (Taika Waititi) and Valkyrie (Tessa Thompson), embark on an epic adventure in a race against time.While audiences have come to expect Marvel films to be epic cinematic events, this film is less on the over-the-top action sequences in favor of establishing new circumstances and challenges for the characters going forward.While there are indeed action sequences and plenty of VFX, it does not have the action or intensity of several of the past films. What it does offer is a good mix of action and humor with enjoyable characters old and new and establishes scenarios for the MCU going forward.Bale is very good as Gorr and you understand his motivations clearly as while evil, he has a degree of sympathy towards his character which makes his creepy performance all the more compelling.The cast works very well with one another and there are two scenes in the credits which open up all kinds of possibilities for the future as we are told Thor will return before the credits even begin to roll.The film also has considerable music and I joked to myself that Guns and Roses are going to be getting a big check due to their music being used frequently during the film as well as that of other artists which helps make the film an enjoyable outing from start to finish which should delight fans as we wait to see for the next cinematic offering from Marvel.4 stars out of 5'),
                  TextSpan(text: 'aaaa'),
                ],
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ));
  }
}
