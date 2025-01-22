import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:resident_app/device/device.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({required this.device, super.key});

  final Device device;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeviceCubit(device: device),
      child: const DeviceView(),
    );
  }
}

class DeviceView extends StatelessWidget {
  const DeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.device.modelName),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.device.roomName!),
              ],
            ),
          ),
        );
      },
    );
  }
}
