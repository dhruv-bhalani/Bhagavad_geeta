import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          homeProviderW.isHindi ? 'Bhagavad Geeta' : "श्रीमद् भगवद् गीता",
          style: const TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: homeProviderW.chapter.length,
          itemBuilder: (context, index) {
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
                    homeProviderR.selectVerse(
                        homeProviderW.chapter[index].chapter_number!);
                    Navigator.pushNamed(context, '/chapters', arguments: index);
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(homeProviderW.chapter[index].img!),
                  ),
                  title: Text(
                    homeProviderW.isHindi
                        ? '${homeProviderW.chapter[index].image_name}'
                        : '${homeProviderW.chapter[index].name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    homeProviderW.isHindi
                        ? "verses : ${homeProviderR.chapter[index].verses_count}"
                        : 'छन्द : ${homeProviderR.chapter[index].verses_count}',
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
