import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String> [
      "Loading movies",
      "Buying popcorn",
      "Loading popular",
      "Calling my girlfriend",
      "Almost there",
      "This is taking longer than expected :("
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (count) {
      return messages[count];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Wait please'),
          const SizedBox(height: 10),
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Loading...');

              return Text(snapshot.data!);
            }
          )
        ],
      ),
    );
  }
}