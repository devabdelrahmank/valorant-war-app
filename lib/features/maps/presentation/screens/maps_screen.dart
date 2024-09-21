import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_war_app/core/my_colors.dart';
import 'package:valorant_war_app/features/maps/presentation/manager/maps_cubit.dart';
import 'package:valorant_war_app/features/maps/presentation/manager/maps_states.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is SuccessFetchdataState) {
          return Scaffold(
              body: ListView.builder(
            itemCount: state.maps.data.length,
            itemBuilder: (BuildContext context, int index) {
              final mapData = state.maps.data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Check if splash is not null or empty
                    if (mapData.splash != null && mapData.splash!.isNotEmpty)
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: mapData.splash!,
                        ),
                      ),
                    // Check if displayIcon is not null or empty
                    if (mapData.displayIcon != null &&
                        mapData.displayIcon!.isNotEmpty)
                      Positioned(
                        right: 10,
                        child: CachedNetworkImage(
                          imageUrl: mapData.displayIcon!,
                          height: 200,
                          width: 223,
                        ),
                      ),
                    Positioned(
                      left: 30,
                      top: 0,
                      child: Text(
                        mapData
                            .displayName, // You can replace this with the actual map name if needed
                        style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            //  fontFamily: 'valorant',
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ));
        }
        if (state is FailureFetchdataState) {
          return Center(child: Text(state.errMessage));
        }

        return const Center(
            child: CircularProgressIndicator(
          color: MyColors.colorFFFD4556,
        ));
      },
      listener: (context, state) {},
    );
  }
}
