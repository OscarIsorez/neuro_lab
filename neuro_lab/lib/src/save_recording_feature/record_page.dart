import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neuro_lab/src/save_recording_feature/audio_player.dart';
import 'package:neuro_lab/src/save_recording_feature/audio_recorder.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:record/record.dart';

class RecordPage extends StatefulWidget {
  static const routeName = '/record';

  const RecordPage({super.key});

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
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
            child: showPlayer
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: AudioPlayer(
                      source: audioPath!,
                      onDelete: () {
                        setState(() => showPlayer = false);
                      },
                    ),
                  )
                : Recorder(
                    onStop: (path) {
                      if (kDebugMode) print('Recorded file path: $path');
                      setState(() {
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
