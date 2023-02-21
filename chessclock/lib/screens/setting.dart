import 'package:chessclock/prvs/ms.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 47, 47),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30.0),
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
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      // setting the global state of Ms and calling "/" to render
                      context.read<Ms>().setMS(1, 0);
                      Navigator.pushNamed(context, "/");
                      //
                    },
                    child: const Text("1 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(1, 1);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("1 | 1"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(2, 1);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("2 | 1"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
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
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(3, 0);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("3 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(3, 2);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("3 | 2"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(3, 5);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("3 | 5"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(5, 0);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("5 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(5, 5);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("5 | 5"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(5, 10);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("5 | 10"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
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
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(10, 0);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("10 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(30, 0);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("30 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(15, 10);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("15 | 10"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(20, 0);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("20 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    onPressed: () {
                      context.read<Ms>().setMS(60, 0);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("60 min"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  height: 50.0,
                  width: (width - 40) / 3,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<Ms>().setMS(45,45);
                      Navigator.pushNamed(context, "/");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    child: const Text("45 | 45"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
