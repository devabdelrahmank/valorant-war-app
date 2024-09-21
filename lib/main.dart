import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_war_app/core/servise/dio_service.dart';
import 'package:valorant_war_app/features/agents/data/repo/agents_repo_impl.dart';
import 'package:valorant_war_app/features/agents/presentation/manager/agents_cubit.dart';
import 'package:valorant_war_app/features/home_screen.dart';
import 'package:valorant_war_app/features/maps/data/repo/maps_repo_impl.dart';
import 'package:valorant_war_app/features/maps/presentation/manager/maps_cubit.dart';
import 'package:valorant_war_app/features/wepons/data/repo/wepon_repo_impl.dart';
import 'package:valorant_war_app/features/wepons/presentation/manager/wepons_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AgentsCubit(
            AgentsRepoImpl(
              api: DioConsumer(
                dio: Dio(),
              ),
            ),
          )..fetchAgentsData(),
        ),
        BlocProvider(
          create: (context) => MapsCubit(
            MapsRepoImpl(
              api: DioConsumer(
                dio: Dio(),
              ),
            ),
          )..fetchMapsData(),
        ),
        BlocProvider(
          create: (context) => WeponsCubit(
            WeponRepoImpl(
              api: DioConsumer(
                dio: Dio(),
              ),
            ),
          )..fetchWeponsData(),
        ),
      ],
      child: MaterialApp(
        title: 'volarnt App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
