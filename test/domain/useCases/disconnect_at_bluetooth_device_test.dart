import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ticket_printer/src/_src.dart';

import '../../helpers/helpers.dart';
import 'start_bluetooth_devices_scan_test.mocks.dart';

void main() {
  late BluetoothRepositoryInterface repository;
  late DisconnectAtBluetoothDevice useCase;

  group('DisconnectAtBluetoothDevice', () {
    setUp(() async {
      repository = MockBluetoothRepositoryInterface();
      useCase = DisconnectAtBluetoothDevice(repository: repository);
    });

    test('should be success when call is called.', () async {
      when(repository.disconnectAtBluetoothDevice())
          .thenAnswer((_) async => kResultOfVoidData);

      final result = await useCase();

      expect(result, kResultOfVoidData);
      verify(repository.disconnectAtBluetoothDevice()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test(
      'should be fail when call is called.',
      () async {
        when(repository.disconnectAtBluetoothDevice())
            .thenAnswer((_) async => resultOfError<void>());

        final result = await useCase();

        expect(result, resultOfError<void>());
        verify(repository.disconnectAtBluetoothDevice()).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
