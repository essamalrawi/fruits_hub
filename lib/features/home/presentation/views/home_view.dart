import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = "home";
  @override
  Widget build(BuildContext context) {

    print("Is this working?");

    return const Scaffold(body: SafeArea(child: HomeViewBody()));
  }
}
