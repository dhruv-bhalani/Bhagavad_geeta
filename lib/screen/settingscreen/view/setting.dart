import 'package:bhagavat_geeta/screen/settingscreen/view/settingprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late SettingProvider settingProviderR;
  late SettingProvider settingProviderW;
  @override
  Widget build(BuildContext context) {
    settingProviderR = context.read<SettingProvider>();
    settingProviderW = context.watch<SettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('English'),
            leading: Radio(
              value: false,
              groupValue: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: const Text('Hindi'),
            leading: Radio(
                value: settingProviderR.languagechenge,
                groupValue: true,
                onChanged: (value) {}),
          ),
          ListTile(
            title: const Text('Sanskrit'),
            leading: Radio(
                value: settingProviderR.languagechenge,
                groupValue: true,
                onChanged: (value) {}),
          ),
          Switch(
            value: settingProviderR.languagechenge,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
