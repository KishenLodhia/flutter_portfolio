import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Portfolio'),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Text('codcok'),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
