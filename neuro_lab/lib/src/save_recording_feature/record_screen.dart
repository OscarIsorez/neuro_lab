// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';

// class RecordingScreen extends StatefulWidget {
//   const RecordingScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _RecordingScreenState createState() => _RecordingScreenState();
// }

// class _RecordingScreenState extends State<RecordingScreen> {
//   bool isRecording = false;
//   String? filePath;
//   String status = "Unknown";

//   void startRecording() async {
//     final service = FlutterBackgroundService();
//     service.startService();
//     setState(() {
//       isRecording = true;
//     });
//   }

//   void stopRecording() async {
//     final service = FlutterBackgroundService();
//     service.invoke('stopService');
//     setState(() {
//       isRecording = false;
//     });
//   }

//   void playAudio() async {
//     if (filePath != null) {
//       AudioPlayer audioPlayer = AudioPlayer();
//       await audioPlayer.play(filePath!, isLocal: true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Starry Night', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.indigo.shade900, Colors.indigo.shade700],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.3),
//                 spreadRadius: 2,
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               isRecording ? "Recording..." : "Press to start recording",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isRecording ? stopRecording : startRecording,
//               child: Text(isRecording ? "Stop Recording" : "Start Recording"),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: playAudio,
//               child: Text("Play Recording"),
//             ),
//             SizedBox(height: 20),
//             Text("Status: $status"),
//           ],
//         ),
//       ),
//     );
//   }
// }
