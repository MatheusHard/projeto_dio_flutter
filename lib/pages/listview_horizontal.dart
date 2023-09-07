import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/shared/utils/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  elevation: 8,
                  child: Image.asset(
                      AppImages.zangado,
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Image.asset(
                  AppImages.woman,
                  ),
                ),
                Card(
                  elevation: 8,
                  child: Image.asset(
                  AppImages.fry,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Container()
          )
        ],
      ),
    );
  }
}
