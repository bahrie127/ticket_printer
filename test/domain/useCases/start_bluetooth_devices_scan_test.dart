import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ticket_printer/src/domain/_domain.dart';

import '../../helpers/helpers.dart';
@GenerateNiceMocks(
  <MockSpec>[
    MockSpec<BluetoothRepositoryInterface>(),
  ],
)
import 'start_bluetooth_devices_scan_test.mocks.dart';

void main() {
  late BluetoothRepositoryInterface repository;
  late StartBluetoothDevicesScan useCase;

  group('StartBluetoothDevicesScan', () {
    setUp(() async {
      repository = MockBluetoothRepositoryInterface();
      useCase = StartBluetoothDevicesScan(repository: repository);
    });

    test('should be success when execute is called.', () async {
      when(repository.startBluetoothDevicesScan(
        timeout: anyNamed('timeout'),
      )).thenAnswer((_) async => resultOfData);

      final result = await useCase.execute();

      expect(result, resultOfData);
      verify(
        repository.startBluetoothDevicesScan(timeout: anyNamed('timeout')),
      ).called(1);
      verifyNoMoreInteractions(repository);
    });

    test(
      'should be fail when execute is called.',
      () async {
        when(repository.startBluetoothDevicesScan(
          timeout: anyNamed('timeout'),
        )).thenAnswer(
            (_) async => resultOfError<List<BluetoothDeviceEntity>>());

        final result = await useCase.execute();

        expect(result, resultOfError<List<BluetoothDeviceEntity>>());
        verify(
          repository.startBluetoothDevicesScan(timeout: anyNamed('timeout')),
        ).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}