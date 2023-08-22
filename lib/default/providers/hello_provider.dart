import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider
final helloWordProvider = Provider((ref) {
  return "Hello Word";
});

final helloWordStateProvider = StateProvider<String>((ref) {
  return "Hello Word";
});
