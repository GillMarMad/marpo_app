import 'package:bloc/bloc.dart';
import 'package:marpo_app/widgets/scan_code_widget.dart';

part 'scan_code_event.dart';
part 'scan_code_state.dart';

class ScanCodeBloc extends Bloc<ScanCodeEvent, ScanCodeState> {
  ScanCodeBloc() : super(const ScanCodeInitial(null)) {
    on<ScanEvent>(_onScan);
  }
  void _onScan(ScanEvent event, Emitter<ScanCodeState> emit) async {
    String code = await scan();
    emit(ScanCodeDoneEvent(code));
  }
}
