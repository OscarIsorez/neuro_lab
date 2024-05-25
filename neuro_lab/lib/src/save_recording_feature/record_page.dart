import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neuro_lab/src/save_recording_feature/audio_player.dart';
import 'package:neuro_lab/src/save_recording_feature/audio_recorder.dart';
import 'package:neuro_lab/src/save_recording_feature/platform/record_list_provider.dart';
import 'package:neuro_lab/src/save_recording_feature/record_model.dart';
import 'package:neuro_lab/utils/models/my_dialog.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/record';

  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
    super.initState();
    showPlayer = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.indigo.shade900, Colors.indigo.shade300],
              ),
            ),
            child: Center(
              child: CircularParticle(
                awayRadius: 80,
                numberOfParticles: 200,
                speedOfParticles: 0.2,
                height: screenHeight,
                width: screenWidth,
                onTapAnimation: false,
                particleColor: Colors.white.withAlpha(150),
                awayAnimationDuration: Duration(milliseconds: 600),
                maxParticleSize: 3,
                isRandSize: true,
                isRandomColor: false,
                randColorList: [Colors.white.withAlpha(210)],
                enableHover: false,
                hoverColor: Colors.white,
                hoverRadius: 90,
                connectDots: false,
              ),
            ),
          ),
          Center(
            child: Recorder(
              onStop: (path, timecodeHighAmplitudeList) {
                if (kDebugMode) print('Recorded file path: $path');
                setState(() {
                  showDialog(
                      context: context,
                      builder: (context) => MyDialog(
                            title: "Save",
                            content: "Wanna save your record ? ",
                            onPressed: () {
                              Provider.of<RecordListProvider>(context,
                                      listen: false)
                                  .addRecording(RecordModel(
                                path: path,
                                date: DateTime.now(),
                                durationHighAmplitudeList:
                                    timecodeHighAmplitudeList,
                              ));
                              Navigator.of(context).pop();
                            },
                          ));

                  audioPath = path;
                  showPlayer = true;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
