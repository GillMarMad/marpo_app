import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../api/product.dart';

part 'pdf_bloc_event.dart';
part 'pdf_bloc_state.dart';

class PDFBloc extends Bloc<PdfBlocEvent, PdfBlocState> {
  PDFBloc() : super(const PdfBlocInitial("")) {
    on<PDFUrlState>(_onGetUriURLEvent);
  }

  void _onGetUriURLEvent(PDFUrlState event, Emitter<PdfBlocState> emit) async {}
}
