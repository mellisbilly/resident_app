import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_repository/property_repository.dart';
import 'package:resident_app/devices/devices.dart';


class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DevicesCubit(context.read<PropertyRepository>())
        ..fetchDevices(),
      child: const DevicesView(),
    );
  }
}

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          tooltip: 'Close',
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            style: textTheme.titleLarge,
            'My Devices',
          ),
        ),
      ),
      body: BlocBuilder<DevicesCubit, DevicesState>(
        builder: (context, state) {
          if (state.status == DevicesStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state.status == DevicesStatus.error) {
            // TODO(billy): generic error message state screen
            return const Center(
              child: Text(
                textAlign: TextAlign.center,
                'Failed to fetch devices',),
            );
          }

          if (state.status == DevicesStatus.success) {
            return TabControllerWidget(
              state: state,
            );
          }

          return Container();
        },
      ),
    );
  }
}

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({
    required this.state, super.key,
  });

  final DevicesState state;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final rooms = state.devices.keys.toList();

    return DefaultTabController(
      length: rooms.length,
      child: Column(
        children: [
          ColoredBox(
            color: colorScheme.primary,
            child: TabBar(
              padding: const EdgeInsets.symmetric(vertical: 4),
              indicatorColor: const Color(0XFF1D85BE),
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelStyle: textTheme.bodyMedium,
              unselectedLabelStyle: textTheme.bodyMedium!.copyWith(
                color: const Color(0xFF667085),
              ),
              tabs: rooms.map((roomName) {
                return Tab(
                  text: roomName,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              children: rooms.map((roomName) {
                final devicesInRoom = state.devices[roomName];

                return ListView(
                  children: devicesInRoom!.map((device) {
                    return DeviceOverviewWidget(
                      device: device,
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
