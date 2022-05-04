import 'package:flutter/material.dart';

class FlipPageReading extends StatefulWidget {
  const FlipPageReading({Key? key}) : super(key: key);

  @override
  State<FlipPageReading> createState() => _FlipPageReadingState();
}

class _FlipPageReadingState extends State<FlipPageReading> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// FlipWidget(
//     key: _flipKey,
//     child: Container(
//         color: Colors.blue,
//         child: Center(
//             child: Text("hello"),
//         ),
//     ),
// )

// //...
// // Show effect layer.
// _flipKey.currentState?.startFlip();
// /// Update the effect layer
// /// [percent] is the position for flipping at the bottom.
// /// [tilt] is the `a` of `y = a*x + b`(line equation). 
// _flipKey.currentState?.flip(percent, tilt);
// /// Dismiss the effect layer and show the original widget.
// _flipKey.currentState?.stopFlip();