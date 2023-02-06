part of 'pdf_bloc_bloc.dart';

abstract class PdfBlocState extends Equatable {
  const PdfBlocState(this.url);
  final String url;

  @override
  List<Object> get props => [url];
}

class PdfBlocInitial extends PdfBlocState {
  const PdfBlocInitial(super.url);
}

class PdfBlocGetUrl extends PdfBlocState {
  const PdfBlocGetUrl(super.url);
}
