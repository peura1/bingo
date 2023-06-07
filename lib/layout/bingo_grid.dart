import 'package:bingo/bloc/bingo_provider.dart';
import 'package:bingo/components/bingo_tile.dart';
import 'package:bingo/models/bingo_item.dart';
import 'package:flutter/material.dart';

class BingoGrid extends StatelessWidget {
  const BingoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BingoItem>>(
      stream: BingoProvider().bingoItems,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            children: snapshot.data!
                .map((e) => BingoTile(
                      item: e,
                    ))
                .toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
