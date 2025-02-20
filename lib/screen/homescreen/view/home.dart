import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  @override
  void initState() {
    context.read<HomeProvider>().getbhagavatjson();
    context.read<HomeProvider>().getchapterjson();
    super.initState();
  }

  final Map<int, String> title = {
    1: 'Shree Bhagavad Geeta',
    2: 'श्री भगवद्‍ गीता',
    3: 'શ્રી ભગવદ ગીતા',
    4: 'श्री भगवद्गीता',
  };

  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Text(
          "${title[homeProviderW.languageIndex]}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(9.0),
          child: Image(
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
        actions: [
          IconButton(
            icon: homeProviderW.isdarkmode
                ? const Icon(
                    Icons.dark_mode,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.light_mode,
                    color: Colors.black,
                  ),
            onPressed: () {
              homeProviderW.isdarkmode
                  ? homeProviderW.changeTheme(false)
                  : homeProviderW.changeTheme(true);
            },
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.language,
              color: Colors.black,
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text(
                  "English",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text(
                  "Hindi",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text(
                  "Gujarati",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text(
                  "Sanskrit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              context.read<HomeProvider>().changeSelectedLanguage(value);
            },
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: homeProviderW.chapter.length,
          itemBuilder: (context, index) {
            final chapters = context.watch<HomeProvider>().chapter[index];
            final chapterName = context.watch<HomeProvider>().languageIndex == 4
                ? chapters.nameModel!.sanskrit
                : context.watch<HomeProvider>().languageIndex == 2
                    ? chapters.nameModel!.hindi
                    : context.watch<HomeProvider>().languageIndex == 1
                        ? chapters.nameModel!.english
                        : chapters.nameModel!.gujarati;
            final chapterSubtitle =
                context.watch<HomeProvider>().languageIndex == 4
                    ? chapters.chapterNumberModel!.sanskrit
                    : context.watch<HomeProvider>().languageIndex == 2
                        ? chapters.chapterNumberModel!.hindi
                        : context.watch<HomeProvider>().languageIndex == 1
                            ? chapters.chapterNumberModel!.english
                            : chapters.chapterNumberModel!.gujarati;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withAlpha(200),
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
                    homeProviderR.selectVerse(homeProviderW.chapter[index].id!);
                    Navigator.pushNamed(context, '/chapters', arguments: index);
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("${homeProviderW.chapter[index].img}"),
                  ),
                  title: Text(
                    "$chapterName",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    "$chapterSubtitle",
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
