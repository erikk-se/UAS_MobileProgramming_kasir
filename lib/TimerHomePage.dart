import 'package:flutter/material.dart';
import 'package:uas/timer.dart';
import 'package:uas/timermodel.dart';
import 'package:uas/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './setting.dart';

class TimerHomePage extends StatelessWidget {
  TimerHomePage({super.key});

  void emptyMethod() {}
  final double defaultPadding = 5.0;

  final CountDownTimer timer = CountDownTimer();
  void goToSettings(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem> menuItems = List.empty(growable: true);
    menuItems.add(const PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));
    timer.startWork();
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Work App'),
          actions: [
            PopupMenuButton(onSelected: (value) {
              if (value == 'Settings') {
                goToSettings(context);
              }
            }, itemBuilder: (BuildContext context) {
              return menuItems.toList();
            })
          ],
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                  color: const Color(0xff009688),
                  text: "Work",
                  onPressed: () => timer.startWork(),
                  size: 150,
                )),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                        color: const Color(0xff607D8B),
                        text: "Short Break",
                        onPressed: () => timer.startBreak(true),
                        size: 150)),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                    child: ProductivityButton(
                        color: const Color(0xff455A64),
                        text: "Long Break",
                        onPressed: () => timer.startBreak(false),
                        size: 150)),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                  initialData: '00:00',
                  stream: timer.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    TimerModel timer = (snapshot.data == '00:00')
                        ? TimerModel('00:00', 1)
                        : snapshot.data;
                    return Expanded(
                        child: CircularPercentIndicator(
                      radius: availableWidth / 2,
                      lineWidth: 10.0,
                      percent: timer.percent,
                      center: Text(timer.time,
                          style: Theme.of(context).textTheme.labelMedium),
                      progressColor: const Color(0xff009688),
                    ));
                  }),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                    child: ProductivityButton(
                        color: const Color(0xff212121),
                        text: 'Stop',
                        onPressed: () => timer.stopTimer(),
                        size: 150)),
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                    child: ProductivityButton(
                        color: const Color(0xff009688),
                        text: 'Restart',
                        onPressed: () => timer.startTimer(),
                        size: 150)),
              ],
            )
          ]);
        }));
  }
}
