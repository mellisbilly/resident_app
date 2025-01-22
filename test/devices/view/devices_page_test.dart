import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:resident_app/devices/devices.dart';

import '../../helpers/helpers.dart';


void main() {
  final device = DeviceMock();
  when(() => device.modelName).thenReturn('Model name');
  when(() => device.name).thenReturn('Device name');
  when(() => device.roomName).thenReturn('Living room');
  when(() => device.modelTypeId).thenReturn('COALARM');

  final modelTypeIds = ['COALARM', 'ENVSENSOR', 'GATEWAY', 'FIREALARM'];

  final devices = modelTypeIds.map((modelTypeId) {
    final mockDevice = DeviceMock();
    when(() => mockDevice.modelName).thenReturn('EI1020 Temperature & Humidity Sensor');
    when(() => mockDevice.roomName).thenReturn('Electricity cupboard');
    when(() => mockDevice.modelTypeId).thenReturn(modelTypeId);

    return mockDevice;
  }).toList();

  final devicesCubit = DevicesCubitMock();
  when(() => devicesCubit.stream).thenAnswer((_) => const Stream.empty());

  testWidgets('devices page success', (tester) async {
    when(() => devicesCubit.state).thenReturn(
      DevicesState(
        status: DevicesStatus.success,
        devices: {
          'Living room': devices,
          'Kitchen': [device],
          'Bedroom': [device],
          'Bathroom': [device],
          'Office': [device],
          'Garage': [device],
        },
      ),
    );

    await tester.golden(
      BlocProvider<DevicesCubit>(
        create: (context) => devicesCubit,
        child: const DevicesView(),
      ),
      'devices_page_success',
    );

    await tester.checkAccessibility(
      BlocProvider<DevicesCubit>(
        create: (context) => devicesCubit,
        child: const DevicesView(),
      ),
    );
  });

  testWidgets('devices page loading', (tester) async {
    when(() => devicesCubit.state).thenReturn(
      const DevicesState(
        status: DevicesStatus.loading,
      ),
    );

    await tester.golden(
      BlocProvider<DevicesCubit>(
        create: (context) => devicesCubit,
        child: const DevicesView(),
      ),
      'devices_page_loading',
    );

    await tester.checkAccessibility(
      BlocProvider<DevicesCubit>(
        create: (context) => devicesCubit,
        child: const DevicesView(),
      ),
    );
  });

  testWidgets('devices page error', (tester) async {
    when(() => devicesCubit.state).thenReturn(
      const DevicesState(
        status: DevicesStatus.error,
      ),
    );

    await tester.golden(
      BlocProvider<DevicesCubit>(
        create: (context) => devicesCubit,
        child: const DevicesView(),
      ),
      'devices_page_error',
    );

    await tester.checkAccessibility(
      BlocProvider<DevicesCubit>(
        create: (context) => devicesCubit,
        child: const DevicesView(),
      ),
    );
  });
}

class DeviceMock extends Mock implements Device {}

class DevicesCubitMock extends Mock implements DevicesCubit {
  @override
  Future<void> close() async {}
}
