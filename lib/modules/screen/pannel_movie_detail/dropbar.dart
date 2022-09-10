import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropBar extends StatelessWidget {
  const DropBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Container(
            alignment: Alignment.center,
            width: 100,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                alignment: Alignment.center,
                hint: const Center(
                  child: Text(
                    'Overview',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                items: <String>[
                  'Main',
                  'Alternative Titles',
                  'Cast & Crew',
                  'Release Dates',
                  'Translations',
                  'Changes'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                alignment: Alignment.center,
                hint: const Text(
                  'Media',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                items: <String>['Backdrops', 'Logos', 'Posters', 'Video']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                alignment: Alignment.center,
                hint: const Text(
                  'Fandom',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                items: <String>[
                  'Disscussion',
                  'Reviews',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                alignment: Alignment.center,
                hint: const Text(
                  'Share',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                items: <String>[
                  'Share',
                  'Facebook',
                  'Tweet',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
