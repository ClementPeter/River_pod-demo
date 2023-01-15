import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/services/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

//Stream provider is useful when the value we are receiving is from a "Stream"

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({this.color, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamReference = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text("Stream Provider"),
        centerTitle: true,
      ),
      body: Center(
        child: streamReference.when(
          data: (data) {
            return Text(data);
          },
          error: (error, _) {
            return Text(
              error.toString(),
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
