import 'package:bloc/bloc.dart';
import 'package:p11/data/datasource/remote/api_service.dart';
import 'package:p11/data/model/random_quote.dart';
import 'package:p11/domain/bloc/quote_event.dart';
import 'package:p11/domain/bloc/quote_state.dart';

class RandomQuoteBloc extends Bloc<RandomQuoteEvent, RandomQuoteState> {
  RandomQuoteBloc() : super(Loading()) {
    on<FetchQuote>((event, emit) => _fetchApi());
  }

  _fetchApi() async {
    emit(Loading());
    try {
      RandomQuote randomQuote = await ApiService.api.fetchRandomQuote();
      emit(Success(randomQuote));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
