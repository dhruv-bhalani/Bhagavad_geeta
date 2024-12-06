import 'package:bhagavat_geeta/model/model.dart';
import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Verses extends StatefulWidget {
  const Verses({super.key});

  @override
  State<Verses> createState() => _VersesState();
}

class _VersesState extends State<Verses> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            homeProviderR.tts.pause();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                homeProviderW
                    .speak("${homeProviderW.selectVerseList[ind].text}");
              },
              icon: const Icon(
                Icons.volume_up,
                color: Colors.black,
              ))
        ],
        title: Text(homeProviderR.isHindi ? 'Verse' : 'श्लोक',
            style: const TextStyle(color: Colors.black, fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView.builder(
          controller: PageController(
            initialPage: ind,
          ),
          itemCount: homeProviderW.selectVerseList.length,
          itemBuilder: (context, index) {
            return Center(
              child: Stack(
                children: [
                  Image.asset('assets/images/5.png'),
                  Center(
                    child: Text(
                      homeProviderW.isHindi
                          ? '${homeProviderW.selectVerseList[index].transliteration}'
                          : '${homeProviderW.selectVerseList[index].text}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
