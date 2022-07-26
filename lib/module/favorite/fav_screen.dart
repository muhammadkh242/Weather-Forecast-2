import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/layout_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LayoutProvider>(
        create: (context) => LayoutProvider(),
        child: Consumer<LayoutProvider>(
            builder: (BuildContext context , layoutProvide, _){
              return const Center(
                child: Text(
                  "Favorite",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
        )
    );
  }
}
