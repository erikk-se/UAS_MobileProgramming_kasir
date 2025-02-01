import 'package:flutter/material.dart';
import 'package:uas/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences prefs;

  final double buttonSize = 150;
  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;

  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";

  late int workTime;
  late int shortBreak;
  late int longBreak;
  TextStyle textStyle = const TextStyle(fontSize: 24);

  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int? workTime = prefs.getInt(WORKTIME);
    int? shortBreak = prefs.getInt(SHORTBREAK);
    int? longBreak = prefs.getInt(LONGBREAK);
    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  void updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          int workTime = prefs.getInt(WORKTIME) ?? 0;
          workTime += value;
          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
        break;
      case SHORTBREAK:
        {
          int short = prefs.getInt(SHORTBREAK) ?? 0;
          short += value;
          if (short >= 1 && short <= 120) {
            prefs.setInt(SHORTBREAK, short);
            setState(() {
              txtShort.text = short.toString();
            });
          }
        }
        break;
      case LONGBREAK:
        {
          int long = prefs.getInt(LONGBREAK) ?? 0;
          long += value;
          if (long >= 1 && long <= 180) {
            prefs.setInt(LONGBREAK, long);
            setState(() {
              txtLong.text = long.toString();
            });
          }
        }
        break;
    }
  }

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: [
          Text("Work", style: textStyle),
          const Text(""),
          const Text(""),
          SettingsButton(const Color(0xff455A64), "-", buttonSize, -1, WORKTIME,
              updateSetting),
          TextField(
              controller: txtWork,
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number),
          SettingsButton(const Color(0xff009688), "+", buttonSize, 1, WORKTIME,
              updateSetting),
          Text("Short", style: textStyle),
          const Text(""),
          const Text(""),
          SettingsButton(const Color(0xff455A64), "-", buttonSize, -1,
              SHORTBREAK, updateSetting),
          TextField(
              controller: txtShort,
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number),
          SettingsButton(const Color(0xff009688), "+", buttonSize, 1,
              SHORTBREAK, updateSetting),
          Text(
            "Long",
            style: textStyle,
          ),
          const Text(""),
          const Text(""),
          SettingsButton(const Color(0xff455A64), "-", buttonSize, -1,
              LONGBREAK, updateSetting),
          TextField(
              controller: txtLong,
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number),
          SettingsButton(const Color(0xff009688), "+", buttonSize, 1, LONGBREAK,
              updateSetting),
        ],
      ),
    );
  }
}
