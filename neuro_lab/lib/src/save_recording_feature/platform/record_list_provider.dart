import 'package:flutter/foundation.dart';
import 'package:neuro_lab/src/save_recording_feature/record_model.dart';

class RecordListProvider with ChangeNotifier {
  final List<RecordModel> _recordings = [];

  List<RecordModel> get recordings => _recordings;

  void addRecording(RecordModel recording) {
    _recordings.add(recording);
    notifyListeners();
  }

  void deleteRecording(RecordModel recording) {
    _recordings.remove(recording);
    notifyListeners();
  }

  void deleteRecordingByIndex(int index) {
    _recordings.removeAt(index);
    notifyListeners();
  }

  void updateRecording(RecordModel oldRecording, RecordModel newRecording) {
    final index = _recordings.indexOf(oldRecording);
    _recordings[index] = newRecording;
    notifyListeners();
  }
}
