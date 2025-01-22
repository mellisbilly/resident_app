part of 'devices_cubit.dart';

enum DevicesStatus { initial, loading, success, error }

final class DevicesState extends Equatable {
  const DevicesState({
    this.status = DevicesStatus.initial,
    this.devices = const {},
  });

  final DevicesStatus status;
  final Map<String, List<Device>> devices;

  DevicesState copyWith({
    DevicesStatus? status,
    Map<String, List<Device>>? devices,
  }) {
    return DevicesState(
      status: status ?? this.status,
      devices: devices ?? this.devices,
    );
  }

  @override
  List<Object> get props => [
        status,
        devices,
      ];
}
