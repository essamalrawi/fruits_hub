import 'package:flutter/material.dart';

import 'widgets/custom_button_navigation_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home_viwe';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
