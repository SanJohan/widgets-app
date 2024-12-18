import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text('Circular progress Indicator'),
          SizedBox(height: 20,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),

          SizedBox(height: 20,),
          Text('Circular y linear indicator controlado'),
          SizedBox(height: 20,),
          _ControlledProgressIndicator()

        ],
      ),
    );
  }
}



class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value * 2)/100; // 0.0, 1.0
      }).takeWhile((value) => value <= 1.0),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12,),
              const SizedBox(width: 20,),
              Expanded(
                child: LinearProgressIndicator(value: progressValue,)
              )
            ],
          ),
        );
      }
    );
  }
}