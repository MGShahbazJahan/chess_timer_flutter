import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(m: 5, s: 5),
        '/setting': (context) => const setting(),
        '/home1': (context) => MyApp(m: 1, s: 0),
        '/home2': (context) => MyApp(m: 1, s: 1),
        '/home3': (context) => MyApp(m: 2, s: 1),
        '/home4': (context) => MyApp(m: 3, s: 0),
        '/home5': (context) => MyApp(m: 3, s: 2),
        '/home6': (context) => MyApp(m: 3, s: 5),
        '/home7': (context) => MyApp(m: 5, s: 0),
        '/home8': (context) => MyApp(m: 5, s: 5),
        '/home9': (context) => MyApp(m: 5, s: 10),
        '/home10': (context) => MyApp(m: 10, s: 0),
        '/home11': (context) => MyApp(m: 30, s: 0),
        '/home12': (context) => MyApp(m: 15, s: 10),
        '/home13': (context) => MyApp(m: 20, s: 0),
        '/home14': (context) => MyApp(m: 60, s: 0),
        '/home15': (context) => MyApp(m: 45, s: 45),
      },
    ),
  );
}

// int m = 5;

class MyApp extends StatefulWidget {
  final m;
  final s;
  MyApp({this.m, this.s});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(m, s);
  }
}

class _MyAppState extends State<MyApp> {
  final int m;
  final int s;
  var whu = 0;
  _MyAppState(this.m, this.s);
  Duration duration1 = Duration();
  Duration duration2 = Duration();
  Timer? timer1;
  Timer? timer2;
  void initState() {
    super.initState();
    Duration duration1 = Duration(minutes: m);
    Duration duration2 = Duration(minutes: m);
    this.duration1 = duration1;
    this.duration2 = duration2;
  }

  void startagain() {
    setState(() {
      Duration d1 = Duration(minutes: m);
      Duration d2 = Duration(minutes: m);
      this.duration1 = d1;
      this.duration2 = d2;
      timer2?.cancel();
      timer1?.cancel();
      whu = 0;
    });
  }

  void remsec1() {
    final remsecond = 1;
    setState(() {
      final seconds1 = duration1.inSeconds - remsecond;
      if (seconds1 == 0 || seconds1 < 0) {
        timer1?.cancel();
      }
      if (seconds1 == 0 || seconds1 < 0) {
        duration1 = Duration(seconds: 0);
      } else {
        duration1 = Duration(seconds: seconds1);
      }
    });
  }

  void remsec2() {
    final remsecond = 1;
    final s = this.s;
    setState(() {
      final seconds2 = duration2.inSeconds - remsecond;
      if (seconds2 == 0 || seconds2 < 0) {
        timer2?.cancel();
      }
      if (seconds2 == 0 || seconds2 < 0) {
        duration2 = Duration(seconds: 0);
      } else {
        duration2 = Duration(seconds: seconds2);
      }
    });
  }

  void starttimer1() {
    if (whu != 1) {
      timer1?.cancel();
      timer2?.cancel();
      final int seconds2 = duration2.inSeconds + s;
      duration2 = Duration(seconds: seconds2);
      timer1 = Timer.periodic(Duration(seconds: 1), (_) => remsec1());
      whu = 1;
    }
  }

  void starttimer2() {
    if (whu != 2) {
      timer1?.cancel();
      timer2?.cancel();
      final int seconds1 = duration1.inSeconds + s;
      duration1 = Duration(seconds: seconds1);
      timer2 = Timer.periodic(Duration(seconds: 1), (_) => remsec2());
      whu = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    Getcol1() {
      if (whu == 1) {
        return Colors.orange;
      } else {
        return Color.fromARGB(255, 92, 91, 91);
      }
    }

    Getcol2() {
      if (whu == 2) {
        return Colors.orange;
      } else {
        return Color.fromARGB(255, 92, 91, 91);
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
      backgroundColor: Color.fromARGB(255, 47, 47, 47),
      body: Container(
        child: Column(
          children: [
            Container(
              height: height * 0.375,
              width: width,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    "$minute1:$second1",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: starttimer2,
                style: ElevatedButton.styleFrom(
                  primary: Getcol1(),
                ),
              ),
            ),
            Center(
              child: Container(
                // color: Color.fromARGB(255, 255, 255, 255),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width * 0.5,
                      child: Padding(
                        padding: EdgeInsets.all(0),
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
                    Container(
                      height: height * 0.25,
                      width: width * 0.5,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: IconButton(
                          icon: const Icon(Icons.restore),
                          iconSize: 50,
                          color: Color.fromARGB(255, 91, 91, 91),
                          onPressed: startagain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.375,
              width: width,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: Text(
                  "$minute2:$second2",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
                onPressed: starttimer1,
                style: ElevatedButton.styleFrom(
                  primary: Getcol2(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 47, 47),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        title: const Text('Setting'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: const Text(
                "Bullet",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      child: const Text("1 min"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home1');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home2');
                      },
                      child: const Text("1 | 1"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home3');
                      },
                      child: const Text("2 | 1"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: const Text(
                "Blitz",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home4');
                      },
                      child: const Text("3 min"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home5');
                      },
                      child: const Text("3 | 2"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home6');
                      },
                      child: const Text("3 | 5"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home7');
                      },
                      child: const Text("5 min"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home8');
                      },
                      child: const Text("5 | 5"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home9');
                      },
                      child: const Text("5 | 10"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: const Text(
                "Rapid",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home10');
                      },
                      child: const Text("10 min"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home11');
                      },
                      child: const Text("30 min"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home12');
                      },
                      child: const Text("15 | 10"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home13');
                      },
                      child: const Text("20 min"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home14');
                      },
                      child: const Text("60 min"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: (width - 40) / 3,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home15');
                      },
                      child: const Text("45 | 45"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
