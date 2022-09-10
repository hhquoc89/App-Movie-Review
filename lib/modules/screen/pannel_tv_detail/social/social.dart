import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/social/discussion.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/social/review.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  late bool isDiscussion;
  @override
  void initState() {
    // TODO: implement initState
    isDiscussion = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      width: 360,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Social', style: appCubit.styles.customTextStyle3()),
            Container(
              alignment: Alignment.topRight,
              height: 34,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isDiscussion = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: const Text(
                        'Discussion',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isDiscussion = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: const Text(
                        'Review',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        isDiscussion ? Discussion() : Review(),
        TextButton(
          child: Text('Go to disscussion',
              style: appCubit.styles.customTextStyle3()),
          onPressed: () {},
        ),
      ]),
    );
  }
}
