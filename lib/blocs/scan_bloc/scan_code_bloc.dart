import 'package:bloc/bloc.dart';
import 'package:marpo_app/api/product.dart';
import 'package:marpo_app/models/product.dart';
import 'package:marpo_app/widgets/scan_code_widget.dart';

part 'scan_code_event.dart';
part 'scan_code_state.dart';

class ScanCodeBloc extends Bloc<ScanCodeEvent, ScanCodeState> {
  ScanCodeBloc() : super(const ScanCodeInitial(null, null)) {
    on<ScanEvent>(_onScan);
  }
  final p = ProductAPI();
  void _onScan(ScanEvent event, Emitter<ScanCodeState> emit) async {
    String code = await scan();
    if (code == "-1") return;
    final product = await p.getProduct(code);
    emit(ScanCodeDoneState(product.description, product));
  }
}
