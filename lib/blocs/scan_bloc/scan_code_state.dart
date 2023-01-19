part of 'scan_code_bloc.dart';

abstract class ScanCodeState {
  final String? code;
  final ProductModel? poduct;

  const ScanCodeState(this.code, this.poduct);
}

class ScanCodeInitial extends ScanCodeState {
  const ScanCodeInitial(super.code, super.poduct);
}

class ScanCodeDoneState extends ScanCodeState {
  const ScanCodeDoneState(super.code, super.poduc);
}
