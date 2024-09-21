import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_war_app/core/my_colors.dart';
import 'package:valorant_war_app/features/wepons/presentation/manager/wepons_cubit.dart';
import 'package:valorant_war_app/features/wepons/presentation/manager/wepons_states.dart';

class WeponsScreen extends StatelessWidget {
  const WeponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeponsCubit, WeponsStates>(
      builder: (context, state) {
        if (state is SuccessFetchWepondataState) {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.wepons.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final weponsData = state.wepons.data![index];
                bool isLeftAligned = index.isEven;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 129,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xff081E34),
                        ),
                      ),
                      if (weponsData.displayIcon != null &&
                          weponsData.displayIcon!.isNotEmpty)
                        Positioned(
                          right: isLeftAligned ? 10 : null,
                          left: isLeftAligned ? null : 0,
                          bottom: 10,
                          //top: 10,
                          child: Center(
                            child: Transform(
                              // اضبط زاوية الدوران هنا باستخدام radians
                              // مثال: 0.1 radians = 5.7 درجات تقريباً
                              transform: isLeftAligned
                                  ? Matrix4.rotationZ(
                                      -10 * 3.14 / 180,
                                    )
                                  : Matrix4.rotationY(3.14 * 3.14),
                              alignment: Alignment.center,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl: weponsData.displayIcon!,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (weponsData.displayName != null &&
                          weponsData.displayName!.isNotEmpty)
                        Positioned(
                          bottom: 45,
                          left: isLeftAligned ? 20 : null,
                          right: isLeftAligned ? null : 20,
                          child: Text(
                            state.wepons.data![index].displayName!,
                            style: const TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              //  fontFamily: 'valorant',
                            ),
                          ),
                        ),
                      if (weponsData.category != null &&
                          weponsData.category!.isNotEmpty)
                        Positioned(
                          bottom: 30,
                          left: isLeftAligned ? 20 : null,
                          right: isLeftAligned ? null : 20,
                          child: Text(
                            state.wepons.data![index].category!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              //  fontFamily: 'valorant',
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        if (state is FailureFetchWepondataState) {
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
