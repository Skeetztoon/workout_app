import 'package:flutter/material.dart';

class PlaceHolderContainer extends StatelessWidget {
  const PlaceHolderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 25.0,
              offset: Offset(
                5,
                5,
              ),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            (DateTime.now().toString()),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          FloatingActionButton.extended(
            label: const Text(
              'LIST',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            backgroundColor: Colors.pink,
            icon: const Icon(
              Icons.add_circle_rounded,
              color: Colors.black87,
              size: 24.0,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}
