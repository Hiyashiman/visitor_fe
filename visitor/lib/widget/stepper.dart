import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
How to Use

import 'package:visitor/pages/stepper.dart';
MyStepper(initialStep: <int 0-6>),


example  
*
SizedBox(
        child: Container(
        height: 150, // Example: Enforce a height constraint
        child: MyStepper(initialStep: 1),
      ),
     )   

*/

class MyStepper extends StatefulWidget {
  final int initialStep;
  const MyStepper({super.key, this.initialStep = 0});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  late int activeStep;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.2;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};

  void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.2);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  void initState() {
    super.initState();
    activeStep = widget.initialStep;
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: IgnorePointer(
            child: Column(
              children: [
                EasyStepper(
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                      lineLength: 100,
                      lineType: LineType.normal,
                      lineThickness: 3,
                      lineSpace: 3,
                      lineWidth: 2,
                      unreachedLineType: LineType.normal,
                      activeLineColor: Colors.amberAccent,
                      defaultLineColor: Colors.amberAccent,
                      finishedLineColor: Colors.green),
                  defaultStepBorderType: BorderType.normal,
                  stepBorderRadius: 10,

                  borderThickness: 5, //ปรับความกว้างของ ขอบ
                  internalPadding: 10, //ปรับความห่างของกล่อง

                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  stepRadius: 30, //ความใหญ่ของกล่อง
                  activeStepTextColor: Colors.black,
                  activeStepBorderColor: Colors.amberAccent,
                  activeStepBackgroundColor: Colors.amberAccent,
                  activeStepIconColor: Colors.black,
                  finishedStepBorderColor: Colors.green,
                  finishedStepTextColor: Colors.green,
                  finishedStepBackgroundColor: Colors.green,
                  finishedStepIconColor: Colors.white,
                  showLoadingAnimation: false,

                  steps: const [
                    EasyStep(
                        icon: Icon(CupertinoIcons.creditcard),
                        title: "Insert Id Card"),
                    EasyStep(
                        icon: Icon(CupertinoIcons.square_stack_3d_up_fill),
                        title: "Select floor"),
                    EasyStep(icon: Icon(CupertinoIcons.info), title: "Info"),
                    EasyStep(
                        icon: Icon(CupertinoIcons.person),
                        title: "Verify person"),
                    EasyStep(
                        icon: Icon(CupertinoIcons.search),
                        title: "Select the business "),
                    EasyStep(
                        icon: Icon(CupertinoIcons.check_mark_circled),
                        title: "Success"),
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
