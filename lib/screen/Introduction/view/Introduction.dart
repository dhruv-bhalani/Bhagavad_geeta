import 'package:bhagavat_geeta/utils/shrHelper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "પ્રવેશ કરો  શ્રીમદ્ ભગવદ્ ગીતા પાસે છે",
              body: '',
              image: Image.asset('assets/images/3.png'),
            ),
            PageViewModel(
              title: "શ્રીમદ્ ભગવદ્ ગીતા ",
              body: '',
              image: Image.asset('assets/images/5.png'),
            ),
            PageViewModel(
              title: "શ્રીમદ્ ભગવદ્ ગીતા- 'સરળ' ",
              body: 'ગમે ત્યાં,ગમે ત્યારે ગીતા વાંચો !',
              image: Image.asset('assets/images/4.png'),
            ),
          ],
          done: const Text('Done'),
          next: const Text('Next'),
          skip: const Text('Skip'),
          onDone: () {
            ShrHelper s = ShrHelper();
            s.shareIntro();
            Navigator.of(context).pushReplacementNamed('/home');
          },
          // onSkip: () {},
          showSkipButton: true,
        ),
      ),
    );
  }
}
