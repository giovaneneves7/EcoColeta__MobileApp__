import 'package:flutter/material.dart';
import 'package:ecocoleta/src/models/descarte.dart';

class NovoDescarte extends StatefulWidget {
  NovoDescarte({
    super.key,
    required this.descarte,
    required this.onAccept,
    required this.onRefuse,
  });

  final Descarte descarte;
  final VoidCallback onAccept;
  final VoidCallback onRefuse;

  static const double SIZED_BOX_WIDTH = 6.0;

  @override
  State<NovoDescarte> createState() => _NovoDescarteState();
}

class _NovoDescarteState extends State<NovoDescarte> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.green[300],
      ),
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.descarte.id.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.descarte.material,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        widget.onAccept();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Text(
                        "Aceitar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: NovoDescarte.SIZED_BOX_WIDTH,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Text(
                        "Detalhes",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: NovoDescarte.SIZED_BOX_WIDTH,
                    ),
                    TextButton(
                      onPressed: () {
                        widget.onRefuse();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Text(
                        "Recusar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}
