import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:property_repository/property_repository.dart';

part 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  DevicesCubit(
    this._propertyRepository,
  ) : super(const DevicesState());

  final PropertyRepository _propertyRepository;

  Future<void> fetchDevices() async {
    emit(state.copyWith(status: DevicesStatus.loading));
    try {
      final devices = await _propertyRepository.getDevices(
        withAlerts: true,
        withEvents: true,
        withLatestReading: true,
      );
      emit(
        state.copyWith(
          status: DevicesStatus.success,
          devices: devices,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: DevicesStatus.error));
    }
  }
}
