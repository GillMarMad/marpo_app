part of 'scan_code_bloc.dart';

abstract class ScanCodeState {
  final String? code;

  const ScanCodeState(this.code);
}

class ScanCodeInitial extends ScanCodeState {
  const ScanCodeInitial(super.code);
}

class ScanCodeDoneEvent extends ScanCodeState {
  const ScanCodeDoneEvent(super.code);
}
