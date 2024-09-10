import 'package:flutter/material.dart';

class AgentsScreenBody extends StatelessWidget {
  final String vectorImage;
  final String backgroundImage;
  final String vectorDiscription;
  const AgentsScreenBody({
    super.key,
    required this.vectorImage,
    required this.backgroundImage,
    required this.vectorDiscription,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 70,
      // fontFamily: 'valorant',
      fontWeight: FontWeight.w900,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Agents',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              //  fontFamily: 'valorant',
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 26),
              child: ImageIcon(
                NetworkImage(
                    'https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png'),
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: Image.network(backgroundImage),
                  ),
                  Image.network(
                    vectorImage,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const Text(
                'description',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'valorant',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                vectorDiscription,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'valorant',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'ABILITIES',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'valorant',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              )
            ],
          ),
        ));
  }
}
