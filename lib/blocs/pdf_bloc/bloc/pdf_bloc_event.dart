part of 'pdf_bloc_bloc.dart';

abstract class PdfBlocEvent extends Equatable {
  const PdfBlocEvent();

  @override
  List<Object> get props => [];
}

class PDFUrlState extends PdfBlocEvent {
  final String code;
  const PDFUrlState(this.code);
}
