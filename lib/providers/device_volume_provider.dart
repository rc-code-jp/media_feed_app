import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceVolumeProvider =
    StateNotifierProvider<FeedStateNotifier, double>((ref) {
  return FeedStateNotifier();
});

class FeedStateNotifier extends StateNotifier<double> {
  FeedStateNotifier() : super(0);

  void setState(double volume) {
    state = volume;
  }
}
