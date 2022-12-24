import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  ref.onDispose(() {
    log('AUTO DISPOSE IS RUNNING');
  });
  ref.onCancel(() {
    log('CANCEL IS RUNNING');
  });
  return Stream.periodic(
    const Duration(seconds: 1),
    (computationCount) => computationCount,
  ).take(10);
});
