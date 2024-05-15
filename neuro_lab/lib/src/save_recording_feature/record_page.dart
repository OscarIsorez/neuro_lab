import 'dart:async';

import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

class RecordPage extends StatefulWidget {
  static const routeName = '/record';

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool _isRecording = false;

  double _width = 200;
  double _height = 200;
  double _outerWidth = 220;
  double _outerHeight = 220;
  bool _isAnimating = false;
  StreamController<bool> _streamController = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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
            child: GestureDetector(
              onTap: () async {
                _isAnimating = !_isAnimating;
                _isRecording = !_isRecording;

                _streamController.add(_isAnimating);

                while (_isAnimating) {
                  if (!mounted) _isAnimating = false;
                  if (mounted) {
                    setState(() {
                      _width = 220;
                      _height = 220;
                      _outerWidth = 240;
                      _outerHeight = 240;
                    });
                  }

                  await Future.delayed(const Duration(milliseconds: 600));
                  if (mounted) {
                    setState(() {
                      _width = 200;
                      _height = 200;
                      _outerWidth = 220;
                      _outerHeight = 220;
                    });
                  }
                  await Future.delayed(const Duration(milliseconds: 600));
                }
              },
              child: StreamBuilder<bool>(
                  stream: _streamController.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    return AnimatedContainer(
                      width: _outerWidth,
                      height: _outerHeight,
                      decoration: BoxDecoration(
                        color: _isRecording
                            ? Colors.cyan[200]
                            : Colors.orange[200],
                        shape: BoxShape.circle,
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: Center(
                        child: AnimatedContainer(
                          width: _width,
                          height: _height,
                          decoration: BoxDecoration(
                            color: _isRecording
                                ? Colors.cyan[400]
                                : Colors.orange[400],
                            shape: BoxShape.circle,
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
