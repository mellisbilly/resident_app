import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_repository/property_repository.dart';
import 'package:resident_app/devices/devices.dart';
import 'package:resident_app/home/home.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        Column(
          children: [
            const HomeAppBarWidget(),
            Expanded(
              child: BlocProvider(
                create: (context) =>
                    DevicesCubit(context.read<PropertyRepository>())
                      ..fetchDevices(),
                child: const RoomSliderWidget(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODOPull users first name from user cubit
          const Text(
            'Hello, Hardcoded',
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          // TODOImplement two badge components for notifications and alarms
          Row(
            children: [
              // TODOReplace with EI alarm icon
              IconButton(
                icon: const Icon(Icons.alarm),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: const DevicesPage(),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
