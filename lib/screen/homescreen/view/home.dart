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
        title: const Center(
          child: Text(
            "શ્રીમદ્ ભગવદ્ ગીતા",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: homeProviderR.bhagavatgeeta
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffe9ae1f),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      shape: BoxShape.values.first,
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        child: Text(e.id.toString()),
                      ),
                      title: Text(e.title!),
                      subtitle: Text(e.text!),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
