import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:qis_quiz/extensions/build_context_ext.dart';
import 'package:qis_quiz/helpers/widgets/buttons.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WaitingRoomPage extends ConsumerWidget {
  const WaitingRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double progressValue = 75.0;

    return Scaffold(
      backgroundColor: Colors.blueGrey, // Dark background for contrast
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Radial Gauge for Progress Indicator
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 270,
                    endAngle: 270,
                    radiusFactor: 0.8,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.2,
                      color: Color.fromARGB(30, 0, 169, 181),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: const <GaugePointer>[
                      RangePointer(
                        value: progressValue,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                        gradient: SweepGradient(
                          colors: <Color>[Color(0xFF00A9B5), Color(0xFF72D8C4)],
                          stops: <double>[0.25, 0.75],
                        ),
                        animationType: AnimationType.ease,
                        enableAnimation: true,
                        animationDuration: 1500,
                      ),
                    ],
                  ),
                  RadialAxis(
                    minimum: 0,
                    interval: 1,
                    maximum: 4,
                    showLabels: false,
                    showTicks: true,
                    showAxisLine: false,
                    tickOffset: -0.05,
                    offsetUnit: GaugeSizeUnit.factor,
                    minorTicksPerInterval: 0,
                    startAngle: 270,
                    endAngle: 270,
                    radiusFactor: 0.8,
                    majorTickStyle: const MajorTickStyle(
                      length: 0.3,
                      thickness: 3,
                      lengthUnit: GaugeSizeUnit.factor,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add space between gauge and text
              // Text displaying progress value

              const Text(
                'Waiting Host to Start the Quiz...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const Gap(20),
              // show name of the user
              const Text(
                'Name: John Doe',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const Gap(20),
              // button to leave the room
              Button.filled(
                onPressed: () {},
                label: 'Leave Room',
                width: context.deviceWidth * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
