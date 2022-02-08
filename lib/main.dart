import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:workout_timer_ui/workout_timer.dart';

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

int timer = seconds;
int minutes = 0;
int seconds = 3;
int rest = 5;
int duration = 1;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                                                          if (minutes > 0 &&
                                                              seconds == 0) {
                                                            minutes -= 1;
                                                            seconds = 60;
                                                          } else if (minutes >
                                                              0) {
                                                            seconds -= 5;
                                                          } else if (seconds >
                                                              20) {
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
                                                          if (rest > 15) {
                                                            rest -= 5;
                                                          }
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
                                                          if (duration > 1) {
                                                            duration--;
                                                          }
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
                                                        setState(() {
                                                          Navigator.pop(
                                                              context);
                                                        });
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
                      height: 50.0,
                      width: 200.0,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return WorkoutTimer(
                                exercise: seconds,
                                sets: duration,
                                rest: rest,
                              );
                            }));
                          },
                          child: Text(
                            'START',
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
