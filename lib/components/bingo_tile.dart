// ignore_for_file: dead_code

import 'dart:async';

import 'package:bingo/bloc/bingo_provider.dart';
import 'package:bingo/models/bingo_item.dart';
import 'package:flutter/material.dart';

class BingoTile extends StatefulWidget {
  const BingoTile({super.key, required this.item});
  final BingoItem item;

  @override
  State<BingoTile> createState() => _BingoTileState();
}

class _BingoTileState extends State<BingoTile> {
  Timer? t;
  bool selectable = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GridTile(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            if (widget.item.selected) {
              BingoProvider().toggle(widget.item.text);
              return;
            }

            if (!selectable) {
              t = Timer(const Duration(milliseconds: 2600), () {
                setState(() {
                  selectable = false;
                });
              });
              setState(() {
                selectable = true;
              });
            } else {
              t?.cancel();
              BingoProvider().toggle(widget.item.text);
              setState(() {
                selectable = false;
              });
            }
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.item.selected
                      ? Colors.yellow[600]
                      : Colors.purple[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Text(
                          widget.item.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: selectable ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow[300],
                  ),
                  height: 1000,
                  width: 1000,
                  child: const Center(
                    child: Text(
                      "Merkitse suoritetuksi",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
