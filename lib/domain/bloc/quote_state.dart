import 'package:p11/data/model/random_quote.dart';

abstract class RandomQuoteState {}

class Loading extends RandomQuoteState {}

class Success extends RandomQuoteState {
  RandomQuote randomQuote;

  Success(this.randomQuote);
}

class Error extends RandomQuoteState {
  String error;

  Error(this.error);
}
