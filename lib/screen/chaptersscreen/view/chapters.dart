import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chapters extends StatefulWidget {
  const Chapters({super.key});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    final chapters = homeProviderW.chapter[ind];
    final chapterName = context.watch<HomeProvider>().languageIndex == 4
        ? chapters.nameModel!.sanskrit
        : context.watch<HomeProvider>().languageIndex == 2
            ? chapters.nameModel!.hindi
            : context.watch<HomeProvider>().languageIndex == 1
                ? chapters.nameModel!.english
                : chapters.nameModel!.gujarati;

    final chapterNumber = homeProviderW.languageIndex == 4
        ? chapters.chapterNumberModel!.sanskrit
        : homeProviderW.languageIndex == 2
            ? chapters.chapterNumberModel!.hindi
            : homeProviderW.languageIndex == 1
                ? chapters.chapterNumberModel!.english
                : chapters.chapterNumberModel!.gujarati;
    final verse = homeProviderW.languageIndex == 4
        ? "श्लोक"
        : homeProviderW.languageIndex == 2
            ? "श्लोक"
            : homeProviderW.languageIndex == 1
                ? "Verse"
                : "શ્લોક";

    final chapterSummary = context.watch<HomeProvider>().languageIndex == 4
        ? chapters.chapter_summary_sanskrit
        : homeProviderW.languageIndex == 2
            ? chapters.chapter_summary_hindi
            : homeProviderW.languageIndex == 1
                ? chapters.chapter_summary
                : chapters.chapter_summary_gujarati;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "$chapterName",
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                items: homeProviderW.images[ind]
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(e), fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 250,
                  reverse: false,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$chapterSummary",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  verse,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: homeProviderR.chapter[ind].verses_count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/verse',
                            arguments: index);
                      },
                      title: Center(
                        child: Text(
                          "$verse ${index + 1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
