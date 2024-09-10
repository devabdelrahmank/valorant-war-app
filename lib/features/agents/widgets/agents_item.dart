import 'package:flutter/material.dart';

class AgentsItem extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final String image;
  final String name;
  const AgentsItem({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          child: Container(
            width: 280,
            height: 430,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(70),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color1,
                  color2,
                  color3,
                  color4,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.12,
          child: Image.network(
            image,
            height: 450,
          ),
        ),
        Positioned(
          left: 35,
          bottom: 50,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w400,
              // fontFamily: 'valorant'
            ),
          ),
        )
      ],
    );
  }
}
