import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futureprovider/stream_provider/stream_controller.dart';

class StreamScreen extends ConsumerStatefulWidget {
  const StreamScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StreamScreenState();
}

class _StreamScreenState extends ConsumerState<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: ref.watch(streamProvider).when(
          data: (data) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Stream Provider is Work!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      data.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
          error: (error, stackTrace) {
            return const SizedBox();
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
