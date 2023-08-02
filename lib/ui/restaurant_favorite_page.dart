import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class RestaurantFavoritePage extends StatelessWidget {
  const RestaurantFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildList(BuildContext context) {
    return const Center(
      child: Text('Coming soon!'),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: _buildList(context),
    );
  }


  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Favorite'),
      ),
      child: _buildList(context),
    );
  }
}
