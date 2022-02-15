import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class WorkoutTimer extends StatefulWidget {
  final int exercise;
  final int rest;
  final int sets;

  WorkoutTimer(
      {required this.exercise, required this.rest, required this.sets});
  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer>
    with TickerProviderStateMixin {
  bool isExercise = true;
  int sets = 0;
  int finalsets = 0;
  final two_pi = 3.14 * 2;
  int duration_counter = 0;

  @override
  void initState() {
    super.initState();
    sets = widget.sets;
    duration_counter = widget.exercise;
  }

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
                padding: const EdgeInsets.only(top: 80.0),
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(seconds: duration_counter),
                  onEnd: () {
                    print(duration_counter);
                    if (isExercise) {
                      setState(() {
                        duration_counter = widget.rest;
                      });
                      //isExercise ? widget.exercise : widget.rest
                      isExercise = false;
                    } else if (isExercise == false) {
                      sets = sets - 1;
                      print(sets);
                      setState(() {
                        duration_counter = widget.exercise;
                      });
                      isExercise = true;
                      //print('completed 1');

                      setState(() {});
                    }
                  },
                  builder: (context, double value, Widget? child) {
                    double convert_seconds = (1 / duration_counter);
                    int seconds_timer = (value ~/ convert_seconds).toInt();
                    return Container(
                      width: 250.0,
                      height: 250.0,
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return SweepGradient(
                                  startAngle: 0.0,
                                  endAngle: two_pi,
                                  stops: [value, value],
                                  // 0.0 , 0.5 , 0.5 , 1.0
                                  center: Alignment.center,
                                  colors: [
                                    Colors.blue,
                                    Colors.grey.withAlpha(55)
                                  ]).createShader(rect);
                            },
                            child: Container(
                              width: 250.0,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 250.0 - 40,
                              height: 250.0 - 40,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                "$seconds_timer",
                                style: TextStyle(fontSize: 40),
                              )),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
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
                  'Set ${sets} of ${widget.sets}',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 80.0),
              //   child: CircularCountDownTimer(
              //     width: 250.0,
              //     height: 250.0,
              //     controller: _controller,
              //     onComplete: () {
              //       if (isExercise) {
              //         _controller.restart(duration: widget.rest);
              //         //isExercise ? widget.exercise : widget.rest
              //         isExercise = false;
              //       } else if (sets <= 0) {
              //         _controller.pause();
              //       } else if (isExercise == false) {
              //         sets = sets - 1;
              //         print(sets);
              //         _controller.restart(duration: widget.exercise);
              //         isExercise = true;
              //         //print('completed 1');

              //         setState(() {});
              //       }
              //     },
              //     duration: widget.exercise,
              //     fillColor: Color.fromARGB(255, 68, 255, 246),
              //     ringColor: Colors.blueGrey,
              //     strokeWidth: 15.0,
              //     textStyle:
              //         TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0),
              //   ),
              // ),
            ]),
          ],
        ),
      ),
    );
  }
}
