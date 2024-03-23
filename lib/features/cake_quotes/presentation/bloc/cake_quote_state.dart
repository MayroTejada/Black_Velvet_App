part of 'cake_quote_bloc.dart';

sealed class CakeQuoteState extends Equatable {
  const CakeQuoteState();
  
  @override
  List<Object> get props => [];
}

final class CakeQuoteInitial extends CakeQuoteState {}
