import 'package:bhagavat_geeta/model/versesmodel.dart';
import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
    final verse = homeProviderW.languageIndex == 4
        ? "श्लोक"
        : homeProviderW.languageIndex == 2
            ? "श्लोक"
            : homeProviderW.languageIndex == 1
                ? "Verse"
                : "શ્લોક";

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
        title: Text(verse,
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
            final text = context.watch<HomeProvider>().languageIndex == 4
                ? context
                    .watch<HomeProvider>()
                    .selectVerseList[index]
                    .textModel!
                    .sanskrit
                : context.watch<HomeProvider>().languageIndex == 2
                    ? context
                        .watch<HomeProvider>()
                        .selectVerseList[index]
                        .textModel!
                        .hindi
                    : context.watch<HomeProvider>().languageIndex == 1
                        ? context
                            .watch<HomeProvider>()
                            .selectVerseList[index]
                            .textModel!
                            .english
                        : context
                            .watch<HomeProvider>()
                            .selectVerseList[index]
                            .textModel!
                            .gujarati;
            return Stack(
              // alignment: Alignment.center,
              children: [
                Image.asset('assets/images/5.png'),
                Align(
                  alignment: const Alignment(0.5, 0.3),
                  child: Text(
                    "$text",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1.0, 0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          homeProviderW.speak("$text");
                        },
                        icon: homeProviderW.isdarkmode
                            ? const Icon(
                                Icons.volume_up,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.volume_up,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share("$text");
                        },
                        icon: homeProviderW.isdarkmode
                            ? const Icon(
                                Icons.share,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
