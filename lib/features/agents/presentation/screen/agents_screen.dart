import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybrid_hex_color_converter/hybrid_hex_color_converter.dart';
import 'package:valorant_war_app/core/my_colors.dart';
import 'package:valorant_war_app/features/agents/presentation/manager/agents_cubit.dart';
import 'package:valorant_war_app/features/agents/presentation/manager/agents_state.dart';
import 'package:valorant_war_app/features/agents/presentation/screen/widgets/agents_item.dart';
import 'package:valorant_war_app/features/agents/presentation/screen/widgets/agents_screen_body.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AgentsCubit, AgentsState>(
      builder: (context, state) {
        if (state is SuccessFetchdataState) {
          return Column(
            children: [
              CarouselSlider(
                items: state.agents.data
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
                                vectorDiscription: item.description.toString(),
                              ),
                            ),
                          );
                        },
                        child: AgentsItem(
                          name: item.displayName.toString(),
                          image: item.fullPortraitV2 == null
                              ? item.abilities[3].displayIcon.toString()
                              : item.fullPortraitV2.toString(),
                          color1: HexColor.fromHex(
                              item.backgroundGradientColors[0]),
                          color2: HexColor.fromHex(
                              item.backgroundGradientColors[3]),
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
        if (state is FailureFetchdataState) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: MyColors.colorFFFD4556,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
