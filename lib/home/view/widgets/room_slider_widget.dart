import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resident_app/devices/devices.dart';

class RoomSliderWidget extends StatefulWidget {
  const RoomSliderWidget({super.key});

  @override
  State<RoomSliderWidget> createState() => _RoomSliderWidgetState();
}

class _RoomSliderWidgetState extends State<RoomSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<DevicesCubit, DevicesState>(
      builder: (context, state) {
        if (state.status == DevicesStatus.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state.status == DevicesStatus.success) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: state.devices.entries.length,
                options: CarouselOptions(
                  height: height * 0.3,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, _) {
                    setState(
                      () => _currentIndex = index,
                    );
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  final  device = state.devices.entries.elementAt(index);
                  return Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            device.key,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < state.devices.entries.length; i++)
                      Container(
                        margin: const EdgeInsets.all(4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == _currentIndex
                              ? Colors.blue
                              : Colors.blue.withValues(alpha: 0.5),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container(
          height: 100,
          color: Colors.red,
        );
      },
    );
  }
}
