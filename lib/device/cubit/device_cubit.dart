import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_api_client/property_api_client.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit({
    required Device device,
  }) : super(DeviceState(
          device: device,
        ),);
}
