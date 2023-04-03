import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HabitTracking extends StatefulWidget {
  const HabitTracking({super.key, required this.title});

  final String title;

  @override
  State<HabitTracking> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HabitTracking> {
  int _counter = 0;
  double _sliderVal = 1;
  final background = const AssetImage("lib/assets/background.jpg");

  void _incrementCounter() {
    setState(() {
      _counter += _sliderVal.toInt();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= _sliderVal.toInt();
    });
  }

  void _incrementSlider(value) {
    setState(() {
      _sliderVal = value;
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: background,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white.withOpacity(0.25),
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            Text("$_sliderVal", textScaleFactor: 4),
            Slider(
              divisions: 9,
              max: 10,
              min: 1,
              onChanged: (value) => _incrementSlider(value),
              value: _sliderVal,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$_counter',
                      style: const TextStyle(color: Colors.white, fontSize: 35),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      onPressed: () {
                        _incrementCounter();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('+', textScaleFactor: 3),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder())),
                      onPressed: () {
                        _decrementCounter();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text('-', textScaleFactor: 3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.abc,
              color: Colors.red,
              size: 64,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.purple,
      onTap: _onItemTapped,
    );
  }
}
