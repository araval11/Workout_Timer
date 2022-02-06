import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int minutes = 0;
  int seconds = 30;
  int rest = 15;
  int duration = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Exercise',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$seconds Sec',
                      style: TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$rest seconds rest, $duration sets',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 45.0,
                      width: 150.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setModalState) {
                                  return Container(
                                    height: 900.0,
                                    color: Color(0xff757575),
                                    child: Container(
                                      height: 900.0,
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'Workout time: 6 mins',
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                Text(
                                                  'Exercise',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setModalState(() {
                                                          if (seconds > 20) {
                                                            seconds -= 5;
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(CupertinoIcons
                                                          .minus_circle),
                                                      iconSize: 40.0,
                                                      color: Colors.blue,
                                                    ),
                                                    Text(
                                                      '$minutes:$seconds sec',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 35.0),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setModalState(() {
                                                          if (seconds < 60) {
                                                            seconds += 5;
                                                          } else if (seconds ==
                                                              60) {
                                                            minutes += 1;
                                                            seconds = 0;
                                                          } else if (minutes >
                                                              0) {
                                                            seconds += 5;
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(CupertinoIcons
                                                          .add_circled),
                                                      iconSize: 40.0,
                                                      color: Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  child: Divider(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                Text(
                                                  'Rest',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setModalState(() {
                                                          rest -= 5;
                                                        });
                                                      },
                                                      icon: Icon(CupertinoIcons
                                                          .minus_circle),
                                                      iconSize: 40.0,
                                                      color: Colors.blue,
                                                    ),
                                                    Text(
                                                      '$rest sec',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 35.0),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setModalState(() {
                                                          rest += 5;
                                                        });
                                                      },
                                                      icon: Icon(CupertinoIcons
                                                          .add_circled),
                                                      iconSize: 40.0,
                                                      color: Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  child: Divider(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                Text(
                                                  'Duration',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setModalState(() {
                                                          duration--;
                                                        });
                                                      },
                                                      icon: Icon(CupertinoIcons
                                                          .minus_circle),
                                                      iconSize: 40.0,
                                                      color: Colors.blue,
                                                    ),
                                                    Text(
                                                      '$duration sets',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 35.0),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setModalState(() {
                                                          duration++;
                                                        });
                                                      },
                                                      icon: Icon(CupertinoIcons
                                                          .add_circled),
                                                      iconSize: 40.0,
                                                      color: Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  child: Divider(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                Container(
                                                  width: 150.0,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return HomePage();
                                                        }));
                                                      },
                                                      child: Text(
                                                        'Done',
                                                      )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          )),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: Text(
                            'SETTINGS',
                            style: TextStyle(color: Colors.blue),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, elevation: 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    Container(
                      width: 200.0,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return HomePage();
                            }));
                          },
                          child: Text(
                            'Start',
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutTimer extends StatefulWidget {
  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Workout Timer',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/736x/5d/53/c5/5d53c5eaf981a2d10211eae217f924e1.jpg'),
                            fit: BoxFit.fill,
                          )),
                      height: 50.0,
                      width: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stay The Night',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Claptone',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 45.0,
                            width: 45.0,
                            child: IconButton(
                              icon: Icon(
                                Icons.pause,
                                color: Colors.blue,
                              ),
                              onPressed: () {},
                            )),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 45.0,
                            width: 45.0,
                            child: IconButton(
                              iconSize: 30.0,
                              icon: Icon(
                                Icons.skip_next_outlined,
                                color: Colors.blue,
                              ),
                              onPressed: () {},
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 245.0, left: 95.0),
                child: Text(
                  'Rest!',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280.0, left: 95.0),
                child: Text(
                  'Set 1 of 8',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: CircularCountDownTimer(
                  width: 250.0,
                  height: 250.0,
                  duration: 10,
                  fillColor: Color.fromARGB(255, 68, 255, 246),
                  ringColor: Colors.blueGrey,
                  strokeWidth: 15.0,
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
