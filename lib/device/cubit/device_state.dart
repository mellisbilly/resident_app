part of 'device_cubit.dart';

enum DeviceStatus { initial, loading, success, error }

final class DeviceState extends Equatable {
  const DeviceState({
    required this.device, this.status = DeviceStatus.initial,
  });

  final DeviceStatus status;
  final Device device;

  @override
  List<Object> get props => [status, device];

  DeviceState copyWith({
    DeviceStatus? status,
    Device? device,
  }) {
    return DeviceState(
      status: status ?? this.status,
      device: device ?? this.device,
    );
  }
}
