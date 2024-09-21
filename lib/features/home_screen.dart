import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:valorant_war_app/core/my_colors.dart';
import 'package:valorant_war_app/core/my_image.dart';
import 'package:valorant_war_app/core/spacer.dart';
import 'package:valorant_war_app/features/agents/presentation/screen/agents_screen.dart';
import 'package:valorant_war_app/features/maps/presentation/screens/maps_screen.dart';
import 'package:valorant_war_app/features/wepons/presentation/screens/wepons_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  final List<Tab> tabs = [
    const Tab(
      text: 'Agents',
    ),
    const Tab(
      text: 'Maps',
    ),
    const Tab(
      text: 'Weapons',
    ),
  ];
  final List<Widget> tab = [
    const AgentsScreen(),
    const MapsScreen(),
    const WeponsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              verticalSpacer(48),
              SvgPicture.asset(MyImage.logoicon),
              verticalSpacer(5),
              SvgPicture.asset(MyImage.logotext),
              verticalSpacer(49),
              TabBar(
                unselectedLabelStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: MyColors.colorFFFD4556,
                ),
                dividerColor: Colors.black,
                //  padding: const EdgeInsets.all(5),
                labelPadding: const EdgeInsets.symmetric(horizontal: 7),
                indicatorWeight: 0.7,
                //   indicatorColor: Colors.yellow,
                overlayColor: WidgetStateProperty.all(Colors.white),
                controller: tabController,
                tabs: tabs,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.white,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: tab,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
