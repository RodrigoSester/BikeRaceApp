import 'package:bike_race_app/models/ride.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RideList extends StatelessWidget {
  const RideList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: RideModel.items.length,
        itemBuilder: ((context, index) {
          final rides = RideModel.items[index];
          return InkWell(
            onTap: () {},
            child: RideItem(rides: rides),
          );
        }));
  }
}

class RideItem extends StatelessWidget {
  final Item rides;
  const RideItem({super.key, required this.rides});

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
