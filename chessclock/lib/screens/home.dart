import "dart:async";

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../prvs/ms.dart';

@immutable
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int m = 0;
  int s = 0;
  var whu = 0;
  Duration duration1 = const Duration();
  Duration duration2 = const Duration();
  Timer? timer1;
  Timer? timer2;
  bool hi = true;
  @override
  void initState() {
    super.initState();
    // getting val from provs and setting it while first entry from stack
    var t = Provider.of<Ms>(context, listen: false);
    m = t.m;
    s = t.s;
    //
    Duration duration1 = Duration(minutes: m);
    Duration duration2 = Duration(minutes: m);
    this.duration1 = duration1;
    this.duration2 = duration2;
  }

  void startagain() {
    setState(() {
      Duration d1 = Duration(minutes: m);
      Duration d2 = Duration(minutes: m);
      duration1 = d1;
      duration2 = d2;
      timer2?.cancel();
      timer1?.cancel();
      whu = 0;
    });
  }

  void remsec1() {
    const remsecond = 1;
    setState(() {
      final seconds1 = duration1.inSeconds - remsecond;
      if (seconds1 == 0 || seconds1 < 0) {
        timer1?.cancel();
      }
      if (seconds1 == 0 || seconds1 < 0) {
        duration1 = const Duration(seconds: 0);
      } else {
        duration1 = Duration(seconds: seconds1);
      }
    });
  }

  void remsec2() {
    const remsecond = 1;
    setState(() {
      final seconds2 = duration2.inSeconds - remsecond;
      if (seconds2 == 0 || seconds2 < 0) {
        timer2?.cancel();
      }
      if (seconds2 == 0 || seconds2 < 0) {
        duration2 = const Duration(seconds: 0);
      } else {
        duration2 = Duration(seconds: seconds2);
      }
    });
  }

  void starttimer1() {
    if (duration1.inSeconds == 0 || duration2.inSeconds == 0) {
      return;
    }
    if (whu != 1) {
      timer1?.cancel();
      timer2?.cancel();
      final int seconds2 = duration2.inSeconds + s;
      duration2 = Duration(seconds: seconds2);
      timer1 = Timer.periodic(const Duration(seconds: 1), (_) => remsec1());
      whu = 1;
    }
  }

  void starttimer2() {
    if (duration1.inSeconds == 0 || duration2.inSeconds == 0) {
      return;
    }
    if (whu != 2) {
      timer1?.cancel();
      timer2?.cancel();
      final int seconds1 = duration1.inSeconds + s;
      duration1 = Duration(seconds: seconds1);
      timer2 = Timer.periodic(const Duration(seconds: 1), (_) => remsec2());
      whu = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getcol1() {
      if (duration1.inSeconds == 0) {
        return Colors.red;
      }
      if (whu == 1) {
        return Colors.orange;
      } else {
        return const Color.fromARGB(255, 92, 91, 91);
      }
    }

    Color getcol2() {
      if (duration2.inSeconds == 0) {
        return Colors.red;
      }
      if (whu == 2) {
        return Colors.orange;
      } else {
        return const Color.fromARGB(255, 92, 91, 91);
      }
    }

    String twodigits(int n) => n.toString().padLeft(2, '0');
    final minute1 = twodigits(duration1.inMinutes);
    final second1 = twodigits(duration1.inSeconds.remainder(60));
    final minute2 = twodigits(duration2.inMinutes);
    final second2 = twodigits(duration2.inSeconds.remainder(60));
    var size = MediaQuery.of(context).size;
    var height = size.height - 40;
    var width = size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 47, 47),
      body: Column(
        children: [
          Container(
            height: height * 0.375,
            width: width,
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: getcol1(),
              ),
              onPressed: starttimer2,
              child: RotatedBox(
                quarterTurns: 2,
                child: Text(
                  "$minute1:$second1",
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              children: [
                SizedBox(
                  height: height * 0.25,
                  width: width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      iconSize: 50,
                      color: const Color.fromARGB(255, 91, 91, 91),
                      onPressed: () {
                        Navigator.pushNamed(context, '/setting');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.25,
                  width: width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                        icon: const Icon(Icons.restore),
                        iconSize: 50,
                        color: const Color.fromARGB(255, 91, 91, 91),
                        onPressed: startagain),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.375,
            width: width,
            margin: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: getcol2(),
              ),
              onPressed: starttimer1,
              child: Text(
                "$minute2:$second2",
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
