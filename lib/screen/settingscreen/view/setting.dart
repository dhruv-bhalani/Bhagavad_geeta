import 'package:bhagavat_geeta/screen/homescreen/view/home_provider.dart';
import 'package:bhagavat_geeta/screen/settingscreen/view/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;

  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
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
          homeProviderW.isHindi ? 'Settings' : 'सेटिंग्स',
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          RadioMenuButton(
            value: true,
            groupValue: homeProviderW.isHindi,
            onChanged: (val) {
              homeProviderW.getHindi(homeProviderW.isHindi);
            },
            child: const Text(
              'English',
            ),
          ),
          RadioMenuButton(
            value: false,
            groupValue: homeProviderW.isHindi,
            onChanged: (val) {
              homeProviderW.isHindi = true;
              homeProviderR.getHindi(homeProviderW.isHindi);
            },
            child: const Text(
              'Hindi',
            ),
          ),
          Switch(
            value: homeProviderW.isdarkmode,
            onChanged: (value) {
              context.read<HomeProvider>().changeTheme(value);
            },
          )
        ],
      ),
    );
  }
}
