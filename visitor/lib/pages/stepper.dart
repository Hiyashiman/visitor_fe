import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
How to Use

import 'package:visitor/pages/stepper.dart';
MyStepper(initialStep: <int 0-6>),


example  
MyStepper(initialStep: 1),

*/ 

class MyStepper extends StatefulWidget {

  final int initialStep;
  const MyStepper({super.key , this.initialStep = 0});

  @override
  State<MyStepper> createState() => _MyStepperState();
  
}

class _MyStepperState extends State<MyStepper> {
  late int activeStep ;
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
  void initState(){
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
                      lineLength: 50,
                      lineType: LineType.normal,
                      lineThickness: 2,
                      lineSpace: 0,
                      lineWidth: 2,
                      unreachedLineType: LineType.normal,
                      activeLineColor: Colors.black,
                      defaultLineColor: Colors.black,
                      finishedLineColor: Colors.green
                      
                      
                    ),
                    defaultStepBorderType: BorderType.normal,
                    stepBorderRadius: 8,

                    borderThickness: 2,//ปรับความกว้างของ ขอบ
                    internalPadding: 0, //ปรับความห่างของกล่อง 
                    
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    stepRadius: 30, //ความใหญ่ของกล่อง 
                    activeStepTextColor: Colors.black,
                    activeStepBorderColor: Colors.black,
                    activeStepIconColor: Colors.black,
                    finishedStepBorderColor: Colors.green,
                    finishedStepTextColor: Colors.green,
                    finishedStepBackgroundColor: Colors.green,
                    
                    finishedStepIconColor: Colors.white,
                    showLoadingAnimation: false,

                    steps:  const [
                      EasyStep(
                        icon: Icon(CupertinoIcons.creditcard),
                      ),
                      EasyStep(
                        icon: Icon(CupertinoIcons.square_stack_3d_up_fill),
                      ), 
                      EasyStep(
                        icon: Icon(CupertinoIcons.info),
                      ),
                       EasyStep(
                        icon: Icon(CupertinoIcons.person),
                      ),
                       EasyStep(
                        icon: Icon(CupertinoIcons.search),
                      ),
                       EasyStep(
                        icon: Icon(CupertinoIcons.check_mark_circled),
                      ),
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
