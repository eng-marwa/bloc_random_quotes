import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p11/domain/bloc/quote_bloc.dart';
import 'package:p11/domain/bloc/quote_event.dart';
import 'package:p11/domain/bloc/quote_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RandomQuoteBloc>().add(FetchQuote());
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Today Quote',
              style: TextStyle(color: Colors.deepPurple, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple),
                    color: Colors.deepPurple[100]),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    BlocBuilder<RandomQuoteBloc, RandomQuoteState>(
                        builder: (context, state) {
                      if (state is Success) {
                        return Column(
                          children: [
                            Text(
                              '${state.randomQuote.content}',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.deepPurple),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                '${state.randomQuote.author}',
                                style: TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      } else if (state is Error) {
                        return Text(
                          state.error,
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                    IconButton(
                        onPressed: () {
                          context.read<RandomQuoteBloc>().add(FetchQuote());
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
