import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_hex_color_converter/hybrid_hex_color_converter.dart';
import 'package:valorant_war_app/core/my_colors.dart';
import 'package:valorant_war_app/features/agents/widgets/agents_item.dart';
import 'package:valorant_war_app/features/agents/model/agents_model.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_war_app/features/agents/widgets/agents_screen_body.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  Future<Agents> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/agents'));

    if (response.statusCode == 200) {
      return Agents.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load Agents-api');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Agents>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                CarouselSlider(
                  items: snapshot.data!.data
                      .map(
                        (item) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AgentsScreenBody(
                                  vectorImage: item.fullPortraitV2 == null
                                      ? item.abilities[0].displayIcon.toString()
                                      : item.fullPortraitV2.toString(),
                                  backgroundImage: item.background.toString(),
                                  vectorDiscription:
                                      item.description.toString(),
                                ),
                              ),
                            );
                          },
                          child: AgentsItem(
                            name: item.displayName.toString(),
                            image: item.fullPortraitV2 == null
                                ? item.abilities[0].displayIcon.toString()
                                : item.fullPortraitV2.toString(),
                            color1: HexColor.fromHex(
                                item.backgroundGradientColors[2]),
                            color2: HexColor.fromHex(
                                item.backgroundGradientColors[2]),
                            color3: HexColor.fromHex(
                                item.backgroundGradientColors[1]),
                            color4: HexColor.fromHex(
                                item.backgroundGradientColors[1]),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 545,
                    initialPage: 0,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
              child: CircularProgressIndicator(
            color: MyColors.colorFFFD4556,
          ));
        });
  }
}
