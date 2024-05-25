import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neuro_lab/src/save_recording_feature/audio_player.dart';
import 'package:neuro_lab/src/save_recording_feature/platform/record_list_provider.dart';

class RecordListViewPage extends StatefulWidget {
  static const routeName = '/records-list';

  const RecordListViewPage({super.key});

  @override
  _RecordListViewPageState createState() => _RecordListViewPageState();
}

class _RecordListViewPageState extends State<RecordListViewPage> {
  String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RecordListProvider>(builder: (context, itemList, child) {
        return ListView.builder(
          itemCount: itemList.recordings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ExpansionTile(
                    backgroundColor: Colors.grey[100],
                    leading:
                        const Icon(Icons.audiotrack, color: Colors.blueAccent),
                    title: Text(
                      itemList.recordings[index].dateStr,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blueAccent,
                    ),
                    children: [
                      Container(
                        color: Colors.blue[50],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          children: [
                            AudioPlayer(
                              source: itemList.recordings[index].path,
                              onDelete: () {
                                setState(() {
                                  itemList.deleteRecordingByIndex(index);
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0;
                                    i <
                                        itemList.recordings[index]
                                            .durationHighAmplitudeList.length;
                                    i++)
                                  Text(
                                    formatDuration(itemList.recordings[index]
                                        .durationHighAmplitudeList[i]),
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
